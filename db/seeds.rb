Lemon.where(
  name: "KING EDWARD",
  species: "BRITON",
  description: "THINE HOLY RINDS FILL THE WORLD WITH JOY"
  ).first_or_create

PrivateDatum.where(
  name: "Justin Hoehner",
  ssn: "214124124124",
  dob: (DateTime.now - 2323.years)
).first_or_create
