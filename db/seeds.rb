#tips
specifics = Tip.create!(title:'Specifics', content:'details and actions')
reasons = Tip.create!(title:'Reasons', content:'"since... so... because..."')
rivals = Tip.create!(title:'Rivals', content:'"someone might say..."')
roadblocks = Tip.create!(title:'Roadblocks', content:'conditions: "if... then"<br />consequences: "might... but"')

# starting point profile
starting_point_profile = Profile.create!(name:'Starting Point Profile', text:'
  <h1>Where are you going in your life?</h1> 
  <p>
    Who do you want to be? And how are you going to get there? The DECISION MAKERS project will help you figure out how to move toward the person you want to be.
  </p>
  <p>
    The special thing about this plan is that it lets you imagine your journey not as <strong>other people</strong> see it, but as <strong>you</strong> see it yourself. Let\'s start at your starting point.
  </p>

  <h2>Where are you right now?</h2> 
  <p>
    This Starting Point Profile will let you take 4 snapshots of your current situation:
  </p>
  <ul> 
    <li><strong>Your Network</strong> &mdash; Who is traveling with you?</li> 
    <li><strong>Your Goals</strong> &mdash; What are you working on in your life now?</li> 
    <li><strong>Your Assets</strong> &mdash; What is your situation?</li> 
    <li><strong>Your Changes</strong> &mdash; A letter to yourself</li> 
  </ul>
')

# snapshot 1
snapshot1 = starting_point_profile.snapshots.create!(name:'Snapshot 1', subtitle:'Who is traveling with me?', text:'
  <p>
    Who are the <strong>key people</strong> on the journey with you?
  </p>
  <p>
    And what is your reason for naming them?  That is, what do they contribute to your network of support?  (Are they role models, mentors, people who challenge you?  Can you turn to them for inspiration, practical advice, recommendations, to learn how to...)?
  </p>
  <ul>
    <li class="pencil"> 
      Write their <strong>names</strong> and <strong>relationship</strong> to you here (e.g., Ms. Jones, my community project contact).
    </li>
    <li class="pencil">
      Then describe your <strong>reason</strong> for including each person. That is, say how, or what it is they contribute to you and your journey. Write their names and relationship to you here (e.g., Ms. Jones - she makes me feel comfortable asking questions and gives me straight answers.).
    </li>
  </ul>
')

  snapshot1.questions.create!(question:'The <strong>key people</strong> on my journey are:', category:'My Supporters and My Reasons', display_order:1, is_codeable:true)





# snapshot 2
snapshot2 = starting_point_profile.snapshots.create!(name:'Snapshot 2', subtitle:'What am I working on in my life now?', text:'
  <p>
    What is important to you at this point in your life?  Think for a moment about some things that matter to you. Think about things you care about, feel committed to, or may even be struggling with in five areas: education, relationships, money, recreation, and health. (The TIPS on the left border will help you create a more complete and reflective picture of yourself.)
  </p>
  
  <ul>
    <li class="pencil"> 
      Try to name the values, goals, or problems you are working on in your everyday life.
    </li>
    <li class="pencil">
      And then describe what you are actually <strong>doing</strong>.
    </li>
  </ul>
')

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Learning and Education', display_order:1, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Learning and Education',  display_order:2, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Personal and Community Relationships', display_order:3, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Personal and Community Relationships', display_order:4, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Making, Budgeting, and Using Money', display_order:5, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Making, Budgeting, and Using Money', display_order:6, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Personal Time and Recreation', display_order:7, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Personal Time and Recreation', display_order:8, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Physical, Emotional, and Sexual Health', display_order:9, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Physical, Emotional, and Sexual Health', display_order:10, is_codeable:true)

  snapshot2.tips = [specifics, reasons, rivals, roadblocks]




# snapshot 3
snapshot3 = starting_point_profile.snapshots.create!(name:'Snapshot 3', subtitle:'What is my situation?', text:'
  <p>
    On the road to our dreams and goals each of us has certain assets or resources that help us get there.  For instance, some people may have:
    <blockquote>
      Financial assets:  money in the bank or a computer or a car they own<br />
      Personal assets:  the ability to work well on a team - or on their own<br />
      Network assets:  connections to people who can help<br />
      Experience assets:  previous jobs, school projects, life experiences they can draw on.
    </blockquote>
  </p>
  <p>
    Everyone\'s situation is different:  you can feel you have lots of resources in some areas. But in other areas you may have no experience or feel like you are out on your own.
  </p>
  <p>
    So what is <strong>your situation</strong>? Answering these questions will help you figure which assets are there for you - and which ones you might want to develop.
  </p>
  <ul>
    <li class="pencil"> 
      How well does each of the following situations or descriptions <strong>fit</strong> - or <strong>not fit</strong> - you?
    </li>
  </ul>
  <table width="100%" cellspacing="5" class="rating"> 
    <tr> 
      <td width="25%" align="center"> 
        <font color="#933"><strong>Not My Situation</strong></font>
        I don\'t think so. Doesn\'t seem like my situation.
      </td>
      <td width="25%" align="center">
        <font color="#933"><strong>Sort Of Fits</strong></font>
        Maybe that\'s sort of true for me sometimes. But not very much.
      </td>
      <td width="25%" align="center"> 
        <font color="#933"><strong>Fits Pretty Well</strong></font>
        Yes, this describes my situation pretty well, most of the time.
      </td>
      <td width="25%" align="center"> 
        <font color="#933"><strong>Strongly Fits</strong></font>
        Definitely. This is strongly true in my situation.
      </td>
    </tr>
  </table>
  <ul>
    <li class="pencil">
      Use the pull-down menu on the right to select the answer which best describes your situation.
    </li>
  </ul>
')

  snapshot3.questions.create!(question:'I am connected to places (like a church or a club) where a young person can play a useful role in their community.', display_order:1)
  snapshot3.questions.create!(question:'Given the way my family works, I can always turn to my family as a positive resource for good advice and help.', display_order:2)
  snapshot3.questions.create!(question:'I am well connected to two or more adults who have strong experiences with a career and post-secondary education and who will support me.', display_order:3)
  snapshot3.questions.create!(question:'I am connected to my community in service to others (for at least an hour per week).', display_order:4)
  snapshot3.questions.create!(question:'I can easily name three or more adults (not parents) who talk with me to advise and encourage me, both now and in the future.', display_order:5)
  snapshot3.questions.create!(question:'In conversations with adults, I find I can communicate my goals and my strengths in ways that they can understand.', display_order:6)
  snapshot3.questions.create!(question:'I consider myself motivated when it comes to school performance even when a subject doesn\'t interest me.', display_order:7)
  snapshot3.questions.create!(question:'I go after opportunities to learn new knowledge or develop skills even when they\'re not required.', display_order:8)
  snapshot3.questions.create!(question:'When I look at the roads I am taking, I sense my life has a clear purpose.', display_order:9)
  snapshot3.questions.create!(question:'I receive lots of encouragement from parents and teachers who have high expectations for me.', display_order:10)
  snapshot3.questions.create!(question:'I have shown that I am a person who can take on responsibility and follow through.', display_order:11)
  snapshot3.questions.create!(question:'When I face problems at school or at work, I know some good strategies for communicating with people so I know I can handle a situation by discussion or explaining.', display_order:12)
  snapshot3.questions.create!(question:'I have a history of making good choices when it comes to alcohol, drugs, and sex.', display_order:13)
  snapshot3.questions.create!(question:'I have a history of handling negative peer pressure especially in difficult situations.', display_order:14)
  snapshot3.questions.create!(question:'I have had successful experiences working with people at school or work who are different from me - because of their race, neighborhood, income or social background.', display_order:15)
  snapshot3.questions.create!(question:'When someone challenges my ideas or beliefs, I feel able to stand up for my ideas in front of others, to do what I think is right.', display_order:16)
  snapshot3.questions.create!(question:'When I face hard choices, I normally think through all my options and possible outcomes rather than waiting to see what happens.', display_order:17)
  snapshot3.questions.create!(question:'I do a lot of planning about my future and the specific things I need to do now.', display_order:18)
  snapshot3.questions.create!(question:'When I enter unfamiliar situations (where people have new expectations of me or confusing ways of explaining things), I am good at finding out all the things I need to know.', display_order:19)
  snapshot3.questions.create!(question:'I feel like I have control over things that are happening in my own life at home, school, work.', display_order:20)
  snapshot3.questions.create!(question:'When I look at my situation and the choices I have made this past year, I would call myself a good decision maker.', display_order:21)
  snapshot3.questions.create!(question:'As for my personal future, I have reasons to feel quite optimistic.', display_order:22)





# snapshot 4
snapshot4 = starting_point_profile.snapshots.create!(name:'Snapshot 4', subtitle:'A letter to myself.', text:'
  <p>Dear self,</p>
  <p>
    I\'ve been spending a little time thinking about <strong>a few things that I\'d like to change in my life</strong>. So, I am writing to you (to myself!) about <strong>what I want to happen for me</strong> in the next few months. When I read this then, I\'ll see how things have gone.
  </p>
')

  snapshot4.questions.create!(question:'One change I\'d like to make...', display_order:1, is_codeable:true)
  snapshot4.questions.create!(question:'Here are some steps I think I can take to make that change:', display_order:2, is_codeable:true)
  snapshot4.questions.create!(question:'I will know I am starting to make progress when...', display_order:3, is_codeable:true)
  snapshot4.questions.create!(question:'A second change I\'d like to make...', display_order:4, is_codeable:true)
  snapshot4.questions.create!(question:'Here are some steps I think I can take to make that change:', display_order:5, is_codeable:true)
  snapshot4.questions.create!(question:'I will know I am starting to make progress when...', display_order:6, is_codeable:true)

  snapshot4.tips = [specifics, reasons, rivals, roadblocks]


=begin
  .
  .
  .
  .
  .
  
    Development stuff only follows
  
  .
  .
  .
  .
  .
=end

  # create some klasses
  klass = Klass.create!(name:'Class of 2014', default_password:'spring2014')
  
  # default admin
  default_admin = Administrator.create!(username:'admin', password:'test', first_name:'Admin', last_name:'User')
  
  # make a default school
  default_school = School.create!(name:'Fox Chapel')

  # make a default scholar
  default_scholar = Scholar.create!(school_id:default_school.id, klass_id:klass.id, username:'user', password:'test', first_name:'Default', last_name:'Scholar', birthdate:Time.new, grade:11)

  # assign the scholar to both profiles
  default_scholar.assignments.create!(profile_id:starting_point_profile.id)
  #default_scholar.assignments.create!(profile_id:check_point_profile.id, assigned:Time.new)
  
  100.times do |i|
    name = Faker::Name.name

    s = Scholar.new
    s.school_id = default_school.id
    s.klass_id = klass.id
    s.username = Faker::Internet.user_name(name)
    s.password = klass.default_password
    s.first_name = name.split(' ')[0]
    s.last_name = name.split(' ')[1]
    s.birthdate = Time.new
    s.grade = 10
    s.save!
    
    a = s.assignments.create!(profile_id:starting_point_profile.id)
end
