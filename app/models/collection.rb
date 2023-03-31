class Collection < ApplicationRecord
  validate :unique_album_status_per_user
  

  belongs_to :album
  belongs_to :user

  has_many :cartlines, dependent: :destroy
  has_many :carts, through: :cartlines

  enum :for_sale, { pas_en_vente: 0, en_vente: 1, vendu: 2 }
  enum :status, { wished: 0, owned: 1}
  enum :sleeve_condition, { A_renseigner: 0,
    Neuf: 1,
    Comme_neuf: 2,
    Très_bon_état: 3,
    Bon_état: 4,
    Etat_acceptable: 5,
    Mauvais_état: 6,
    Très_mauvais_état: 7,
    Dechirée: 8,
    Abimée: 9,
    Manquante: 10}, prefix: true

  enum :media_condition, {
    A_renseigner: 0,
    Neuf: 1,
    Comme_neuf: 2,
    Très_bon_état: 3,
    Bon_état: 4,
    Etat_acceptable: 5,
    Mauvais_état: 6,
    Tres_mauvais_état: 7,
    Raye: 8,
    Saute: 9,
    Endommagé: 10 }, prefix: true


    def update_for_sale_status
      if status == "wished"
        self.pas_en_vente!
      end
    end


  def unique_album_status_per_user
    if user.collections.exists?(album_id: album_id, status: status == "owned" ? "wished" : "owned")
      errors.add(:base, "This album is already in the collection with a different status")
      redirect_to root_path
    end
  end

end
