###
/lib/schemas/user.schema.coffee

Holds schema(s) definition for docs in Meteor.users collection
###

#####################################################################

Schemas.user = new SimpleSchema 

	# _id array of user's tasks
	task_id_list:
		type: [String]
		optional: true

	# _id array of user's schedules
	schedule_id_list:
		type: [String]
		optional: true

	# tags for tasks
	tags:
		type: [String]

	# default schedule's _id (holds)
	default_sched:
		type: String
		optional: true

	####################################################################

	username: 
    type: String
    regEx: /^[a-z0-9A-Z_]{3,20}$/
    optional: true

  emails: 
    type: [Object]
    # this must be optional if you also use other login services like facebook
    # but if you use only accounts-password then it can be required
    optional: true
  
  "emails.$.address": 
    type: String
    regEx: SimpleSchema.RegEx.Email
  
  "emails.$.verified": 
    type: Boolean

  createdAt: 
    type: Date
  
  profile: 
    type: Schemas.UserProfile
    optional: true
  
  services: 
    type: Object
    optional: true
    blackbox: true
  
  # Add `roles` to your schema if you use the meteor-roles package.
  # Option 1: Object type
  # If you specify that type as Object you must also specify the
  # `Roles.GLOBAL_GROUP` group whenever you add a user to a role.
  # Example:
  # Roles.addUsersToRoles(userId ["admin"] Roles.GLOBAL_GROUP);
  # You can't mix and match adding with and without a group since
  # you will fail validation in some cases.
  roles: 
    type: Object
    optional: true
    blackbox: true
  
  # Option 2: [String] type
  # If you are sure you will never need to use role groups then
  # you can specify [String] as the type
  roles: 
    type: [String]
    optional: true
  
  #####################################################



Schemas.UserCountry = new SimpleSchema
  name: 
    type: String
  
  code: 
    type: String
    regEx: /^[A-Z]{2}$/


Schemas.UserProfile = new SimpleSchema
  firstName: 
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true
  
  lastName: 
    type: String
    regEx: /^[a-zA-Z]{2,25}$/
    optional: true
  
  birthday: 
    type: Date
    optional: true
  
  gender: 
    type: String
    allowedValues: ['Male', 'Female']
    optional: true

  organization : 
    type: String
    regEx: /^[a-z0-9A-z .]{3,30}$/
    optional: true
  
  website: 
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true
  
  bio: 
    type: String
    optional: true
  
  country: 
    type: Schemas.UserCountry
    optional: true
    
Meteor.users.attachSchema Schemas.user