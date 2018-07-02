employee = Employee.where(
  name: "Cersei Lannister",
  title: "Staff Engineer"
).first_or_create!

milestone = Milestone.where(
  mobile: 1,
  web_client: 2,
  foundations: 3,
  servers: 2,
  project_management: 4,
  communication: 1,
  craft: 1,
  initiative: 4,
  career_development: 3,
  org_design: 2,
  wellbeing: 0,
  accomplishment: 4,
  mentorship: 2,
  evangelism: 2,
  recruiting: 3,
  community: 0,
  employee: employee
).first_or_create!