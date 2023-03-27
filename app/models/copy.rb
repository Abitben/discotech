class Copy < ApplicationRecord
  enum :status, { whished: 0, owned: 1}
  enum :sleeve_condition, { neuf: 0,
    comme_neuf: 1,
    tres_bon_etat: 2,
    bon_etat: 3,
    etat_acceptable: 4,
    mauvais_etat: 5,
    tres_mauvais_etat: 6,
    déchirée: 7,
    abîmée: 8,
    manquante: 9}

  enum :media_condition, {
    neuf: 0,
    comme_neuf: 1,
    tres_bon_etat: 2,
    bon_etat: 3,
    etat_acceptable: 4,
    mauvais_etat: 5,
    tres_mauvais_etat: 6,
    rayé: 7,
    saute: 8,
    endommagé: 9
  } 
  
  belongs_to :album
  belongs_to :user

end
