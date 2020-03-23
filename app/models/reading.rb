class Reading < ApplicationRecord

  # validates :age, presence: true
  # validates :sex, presence: true
  validates :zipcode, presence: true
  # validates :site, presence: true
  validates :temp_f, presence: true
  validates :browser_uuid, presence: true
  validates :household_person, presence: true

  SYMPTOMS = {
    sym_cough: "cough",
    sym_short_breath: "shortness of breath",
    sym_fatigue: "fatigue",
    sym_sore_throat: "sore throat",
    sym_runny_nose: "runny nose",
    sym_aches: "aches",
    sym_vomiting: "vomiting",
    sym_diarrhea: "diarrhea"
  }

  def humanized_symptoms
    SYMPTOMS.keys.filter { |k| self[k] }
  end

end
