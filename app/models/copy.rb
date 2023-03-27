class Copy < ApplicationRecord
  enum :status, { whished: 0, owned: 1}
  enum :sleeve_condition, { Neuf: 0,
    Comme_neuf: 1,
    Très_bon_état: 2,
    Bon_état: 3,
    Etat_acceptable: 4,
    Mauvais_état: 5,
    Très_mauvais_état: 6,
    Dechirée: 7,
    Abimée: 8,
    Manquante: 9}, prefix: true

  enum :media_condition, {
    Neuf: 0,
    Comme_neuf: 1,
    Très_bon_état: 2,
    Bon_état: 3,
    Etat_acceptable: 4,
    Mauvais_état: 5,
    Tres_mauvais_état: 6,
    Raye: 7,
    Saute: 8,
    Endommagé: 9 }, prefix: true
  
  belongs_to :album
  belongs_to :user

end
