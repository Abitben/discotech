# frozen_string_literal: true

module ActiveStorage
  class Variant
    attr_reader :blob, :variation

    delegate :service, to: :blob
    delegate :content_type, to: :variation

    def initialize(blob, variation_or_variation_key)
      @blob = blob
      @variation = ActiveStorage::Variation.wrap(variation_or_variation_key)
    end

    # Returns the variant instance itself after it's been processed or an existing processing has been found on the service.
    def processed
      process unless processed?
      self
    end

    # Returns a combination key of the blob and the variation that together identifies a specific variant.
    def key
      "variants/#{blob.key}/#{OpenSSL::Digest::SHA256.hexdigest(variation.key)}"
    end

    # Returns the URL of the blob variant on the service. See {ActiveStorage::Blob#url} for details.
    #
    # Use <tt>url_for(variant)</tt> (or the implied form, like +link_to variant+ or +redirect_to variant+) to get the stable URL
    # for a variant that points to the ActiveStorage::RepresentationsController, which in turn will use this +service_call+ method
    # for its redirection.
    def url(expires_in: ActiveStorage.service_urls_expire_in, disposition: :inline)
      service.url key, expires_in:, disposition:, filename:, content_type:
    end

    # Downloads the file associated with this variant. If no block is given, the entire file is read into memory and returned.
    # That'll use a lot of RAM for very large files. If a block is given, then the download is streamed and yielded in chunks.
    def download(&block)
      service.download key, &block
    end

    def filename
      ActiveStorage::Filename.new "#{blob.filename.base}.#{variation.format.downcase}"
    end

    alias content_type_for_serving content_type

    def forced_disposition_for_serving # :nodoc:
      nil
    end

    # Returns the receiving variant. Allows ActiveStorage::Variant and ActiveStorage::Preview instances to be used interchangeably.
    def image
      self
    end

    # Deletes variant file from service.
    def destroy
      service.delete(key)
    end

    private

    def processed?
      service.exist?(key)
    end

    def process
      blob.open do |input|
        variation.transform(input) do |output|
          service.upload(key, output, content_type:)
        end
      end
    end
  end
end
