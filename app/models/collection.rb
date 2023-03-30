class Collection < ApplicationRecord
  belongs_to :album
  belongs_to :user

  has_many :cartlines
  has_many :carts, through: :cartlines

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
end
