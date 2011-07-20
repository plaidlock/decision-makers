# question categories
rwa = QuestionCategory.create!(name:'Relations with Adults', color:'#003366')
aar = QuestionCategory.create!(name:'Agency and Responsibility', color:'#993333')
aam = QuestionCategory.create!(name:'Attitudes and Motivation', color:'#ffff9a')
pdm = QuestionCategory.create!(name:'Planning and Decision Making', color:'#b3c98b')
dwo = QuestionCategory.create!(name:'Dealing with Others', color:'#303b13')

# tips
specifics = Tip.create!(title:'Specifics', content:'details and actions')
reasons = Tip.create!(title:'Reasons', content:'"since... so... because..."')
rivals = Tip.create!(title:'Rivals', content:'"someone might say..."')
roadblocks = Tip.create!(title:'Roadblocks', content:'conditions: "if... then"<br />consequences: "might... but"')

# starting point profile
starting_point_profile = Profile.create!(name:'Starting Point Profile', text:'
  <h3>Where are you going in your life?</h3>
  <p>
    Who do you want to be? And how are you going to get there? The DECISION MAKERS project will help you figure out how to move toward the person you want to be.
  </p>
  <p>
    The special thing about this plan is that it lets you imagine your journey not as <strong>other people</strong> see it, but as <strong>you</strong> see it yourself. Let\'s start at your starting point.
  </p>

  <h3>Where are you right now?</h3>
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
  <ul class="pencil">
    <li> 
      Write their <strong>names</strong> and <strong>relationship</strong> to you here (e.g., Ms. Jones, my community project contact).
    </li>
    <li>
      Then describe your <strong>reason</strong> for including each person. That is, say how, or what it is they contribute to you and your journey. Write their names and relationship to you here (e.g., Ms. Jones - she makes me feel comfortable asking questions and gives me straight answers.).
    </li>
  </ul>
  <h3>My Network</h3>
', display_order:1)

  snapshot1.questions.create!(question:'The <strong>key people</strong> on my journey are:', category:'My Supporters and My Reasons', display_order:1, is_codeable:true)





# snapshot 2
snapshot2 = starting_point_profile.snapshots.create!(name:'Snapshot 2', subtitle:'What am I working on in my life now?', text:'
  <p>
    What is important to you at this point in your life?  Think for a moment about some things that matter to you. Think about things you care about, feel committed to, or may even be struggling with in five areas: education, relationships, money, recreation, and health. (The TIPS on the left border will help you create a more complete and reflective picture of yourself.)
  </p>
  
  <ul class="pencil">
    <li> 
      Try to name the values, goals, or problems you are working on in your everyday life.
    </li>
    <li>
      And then describe what you are actually <strong>doing</strong>.
    </li>
  </ul>
', display_order:2)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Learning and Education', question_number:'1a', display_order:1, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Learning and Education', question_number:'1b',  display_order:2, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Personal and Community Relationships', question_number:'2a', display_order:3, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Personal and Community Relationships', question_number:'2b', display_order:4, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Making, Budgeting, and Using Money', question_number:'3a', display_order:5, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Making, Budgeting, and Using Money', question_number:'3b', display_order:6, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Personal Time and Recreation', question_number:'4a', display_order:7, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Personal Time and Recreation', question_number:'4b', display_order:8, is_codeable:true)

  snapshot2.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', category:'In Physical, Emotional, and Sexual Health', question_number:'5a', display_order:9, is_codeable:true)
  snapshot2.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', category:'In Physical, Emotional, and Sexual Health', question_number:'5b', display_order:10, is_codeable:true)

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
  <ul class="pencil">
    <li> 
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
  <ul class="pencil">
    <li>
      Use the pull-down menu on the right to select the answer which best describes your situation.
    </li>
  </ul>
', display_order:3)

  snapshot3.questions.create!(question:'I am connected to places (like a church or a club) where a young person can play a useful role in their community.', question_number:'1', display_order:1, question_category:aar)
  snapshot3.questions.create!(question:'Given the way my family works, I can always turn to my family as a positive resource for good advice and help.', question_number:'2', display_order:2, question_category:rwa)
  snapshot3.questions.create!(question:'I am well connected to two or more adults who have strong experiences with a career and post-secondary education and who will support me.', question_number:'3', display_order:3, question_category:rwa)
  snapshot3.questions.create!(question:'I am connected to my community in service to others (for at least an hour per week).', question_number:'4', display_order:4, question_category:aar)
  snapshot3.questions.create!(question:'I can easily name three or more adults (not parents) who talk with me to advise and encourage me, both now and in the future.', question_number:'5', display_order:5, question_category:rwa)
  snapshot3.questions.create!(question:'In conversations with adults, I find I can communicate my goals and my strengths in ways that they can understand.', question_number:'6', display_order:6, question_category:aar)
  snapshot3.questions.create!(question:'I consider myself motivated when it comes to school performance even when a subject doesn\'t interest me.', question_number:'7', display_order:7, question_category:aam)
  snapshot3.questions.create!(question:'I go after opportunities to learn new knowledge or develop skills even when they\'re not required.', question_number:'8', display_order:8, question_category:aam)
  snapshot3.questions.create!(question:'When I look at the roads I am taking, I sense my life has a clear purpose.', question_number:'9', display_order:9, question_category:aam)
  snapshot3.questions.create!(question:'I receive lots of encouragement from parents and teachers who have high expectations for me.', question_number:'10', display_order:10, question_category:rwa)
  snapshot3.questions.create!(question:'I have shown that I am a person who can take on responsibility and follow through.', question_number:'11', display_order:11, question_category:aar)
  snapshot3.questions.create!(question:'When I face problems at school or at work, I know some good strategies for communicating with people so I know I can handle a situation by discussion or explaining.', question_number:'12', display_order:12, question_category:pdm)
  snapshot3.questions.create!(question:'I have a history of making good choices when it comes to alcohol, drugs, and sex.', question_number:'13', display_order:13, question_category:pdm)
  snapshot3.questions.create!(question:'I have a history of handling negative peer pressure especially in difficult situations.', question_number:'14', display_order:14, question_category:dwo)
  snapshot3.questions.create!(question:'I have had successful experiences working with people at school or work who are different from me - because of their race, neighborhood, income or social background.', question_number:'15', display_order:15, question_category:dwo)
  snapshot3.questions.create!(question:'When someone challenges my ideas or beliefs, I feel able to stand up for my ideas in front of others, to do what I think is right.', question_number:'16', display_order:16, question_category:dwo)
  snapshot3.questions.create!(question:'When I face hard choices, I normally think through all my options and possible outcomes rather than waiting to see what happens.', question_number:'17', display_order:17, question_category:pdm)
  snapshot3.questions.create!(question:'I do a lot of planning about my future and the specific things I need to do now.', question_number:'18', display_order:18, question_category:pdm)
  snapshot3.questions.create!(question:'When I enter unfamiliar situations (where people have new expectations of me or confusing ways of explaining things), I am good at finding out all the things I need to know.', question_number:'19', display_order:19, question_category:dwo)
  snapshot3.questions.create!(question:'I feel like I have control over things that are happening in my own life at home, school, work.', question_number:'20', display_order:20, question_category:aam)
  snapshot3.questions.create!(question:'When I look at my situation and the choices I have made this past year, I would call myself a good decision maker.', question_number:'21', display_order:21, question_category:pdm)
  snapshot3.questions.create!(question:'As for my personal future, I have reasons to feel quite optimistic.', question_number:'22', display_order:22, question_category:aam)





# snapshot 4
snapshot4 = starting_point_profile.snapshots.create!(name:'Snapshot 4', subtitle:'A letter to myself.', text:'
  <p>Dear self,</p>
  <p>
    I\'ve been spending a little time thinking about <strong>a few things that I\'d like to change in my life</strong>. So, I am writing to you (to myself!) about <strong>what I want to happen for me</strong> in the next few months. When I read this then, I\'ll see how things have gone.
  </p>
', display_order:4)

  snapshot4.questions.create!(question:'One change I\'d like to make...', question_number:'1a', display_order:1, is_codeable:true)
  snapshot4.questions.create!(question:'Here are some steps I think I can take to make that change:', question_number:'1b', display_order:2, is_codeable:true)
  snapshot4.questions.create!(question:'I will know I am starting to make progress when...', question_number:'1a', display_order:3, is_codeable:true)
  snapshot4.questions.create!(question:'A second change I\'d like to make...', question_number:'2a', display_order:4, is_codeable:true)
  snapshot4.questions.create!(question:'Here are some steps I think I can take to make that change:', question_number:'2b', display_order:5, is_codeable:true)
  snapshot4.questions.create!(question:'I will know I am starting to make progress when...', question_number:'2c', display_order:6, is_codeable:true)

  snapshot4.tips = [specifics, reasons, rivals, roadblocks]


# check point profile
check_point_profile = Profile.create!(name:'Check Point Profile', text:'
  <p>
    Click Next to begin your Check Point Profile
  </p>
')

# snapshot 1
snapshot1 = check_point_profile.snapshots.create!(name:'Snapshot 1', subtitle:'Who is traveling with me?', text:'
  <p>Who are the <strong>key</strong> people traveling with me <strong>now</strong>?</p>
  <p>
    In your Starting Point Profile, you listed key people who contribute different things to your network of support (by being role models, mentors, or people who challenge you). And you noted your reasons for including each one. (That is, you can turn to them for inspiration, practical advice, recommendations, to learn how to...)
  </p>
  <p>
    For this Check Point, consider your Network of Support again. Has it grown? Can you see new or additional reasons you might have for calling on different people?
  </p>
  <ul class="pencil">
    <li>
      Write their <strong>names</strong> and <strong>relationship</strong> to you below (e.g., Ms. Smith, another employee at my job).
    </li>
    <li>
      Then describe your <strong>reasons</strong> for including each person. That is, say how, or what it is they could contribute as part of your network of support (e.g., She shows me how to keep my cool, even when we are under pressure.)
    </li>
  </ul>
  <h3>My Network</h3>
', display_order:1)

  snapshot1.questions.create!(question:'The <strong>key people</strong> on my journey are:', category:'My Supporters and My Reasons', question_number:'1', display_order:1, is_codeable:true)


# snapshot 2
snapshot2 = check_point_profile.snapshots.create!(name:'Snapshot 2', subtitle:'How am I doing as a Decision Maker?', text:'
  <p>
    Think back to a recent situation where you feel that you acted like a <strong>strong</strong> decision maker. That is, where you considered your options and reflected on rivals and possible outcomes before you acted.
  </p>
  <ul class="pencil">
    <li>
      Describe your decision making <strong>process</strong> and what you had to think about.
    </li>
    <li>
      On the next page say what you think it shows <strong>about you</strong>. Imagine you are describing this decision to a potential employer, a mentor, or a younger person you want to mentor.
    </li>
  </ul>
', display_order:2)

  snapshot2.questions.create!(question:'In my situation, I had to make a decision about... And some of the options, rivals, or roadblocks I had to consider were...', question_number:'1', display_order:1, is_codeable:true)
  snapshot2.questions.create!(question:'I made the decision I did because...', question_number:'2', display_order:2, is_codeable:true)
  snapshot2.questions.create!(question:'What I learned about dealing with situations like this was...', question_number:'3', display_order:3, is_codeable:true)
  snapshot2.questions.create!(question:'What this shows about me as a decision maker is...', question_number:'4', display_order:4, is_codeable:true)
  snapshot2.questions.create!(question:'Test your strength as a decision maker. Look at the 4 features of <strong>strong</strong> decision making (listed under Tips on the left). How many of these <strong>4 features</strong> can you find in each part of your story? For example, "My first comment box has specifics and a rival. My second box has..."', question_number:'5', display_order:5, is_codeable:true)


# snapshot 3
snapshot3 = check_point_profile.snapshots.create!(name:'Snapshot 3', subtitle:'What am I working on in my life now?', text:'
  <p>
    Think back to the values, goals, or problems that were important to you when you wrote your Starting Point Profile. For this Check Point we will focus on what you are working on now in just three areas: in learning and education; in personal and community relationships; and in making, budgeting and using money.
  </p>
  <ul class="pencil">
    <li>
      See if you can write a <strong>stronger</strong> (more reflective) description of your goals and your plans and steps now that some time has passed.
    </li>
    <li>
      Use the TIPS on the left border to help you create a more complete picture of yourself as a reflective decision maker in these three areas of your life.
    </li>
  </ul>
', display_order:3)

  snapshot3.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', question_number:'1', category:'In Learning and Education', display_order:1, is_codeable:true)
  snapshot3.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', question_number:'2', category:'In Learning and Education',  display_order:2, is_codeable:true)

  snapshot3.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', question_number:'3', category:'In Personal and Community Relationships', display_order:3, is_codeable:true)
  snapshot3.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', question_number:'4', category:'In Personal and Community Relationships', display_order:4, is_codeable:true)

  snapshot3.questions.create!(question:'What matters to me? What values or goals or problems am I working on in my life?', question_number:'5', category:'In Making, Budgeting, and Using Money', display_order:5, is_codeable:true)
  snapshot3.questions.create!(question:'What specific steps am I taking to reach my goals or act on what I care about?', question_number:'6', category:'In Making, Budgeting, and Using Money', display_order:6, is_codeable:true)

  snapshot3.tips = [specifics, reasons, rivals, roadblocks]





  # default admin
  default_admin = Administrator.create!(username:'admin', password:'test', first_name:'Admin', last_name:'User')


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

if Rails.env.development?
  # make a default school
  School.create!(name:'Fox Chapel')
  School.create!(name:'Swickley')
  
  # create some klasses
  Klass.create!(name:'Class of 2014', default_password:'spring2014')
  Klass.create!(name:'Class of 2015', default_password:'spring2015')
  Klass.create!(name:'Class of 2016', default_password:'spring2016')
  Klass.create!(name:'Class of 2017', default_password:'spring2017')
  Klass.create!(name:'Class of 2018', default_password:'spring2018')
  Klass.create!(name:'Class of 2019', default_password:'spring2019')
  Klass.create!(name:'Class of 2020', default_password:'spring2020')
  
  # make a default scholar
  default_scholar = Scholar.create!(school:School.find(1), klass:Klass.find(1), username:'user', password:'test', first_name:'Default', last_name:'Scholar', birthdate:Time.new, grade:11)
  
  70.times do |i|
    name = Faker::Name.name

    s = Scholar.new
    s.school = School.find(rand(2)+1)
    s.klass = Klass.find((i%7)+1)
    s.username = Faker::Internet.user_name(name)
    s.password = 'test'
    s.first_name = name.split(' ')[0]
    s.last_name = name.split(' ')[1]
    s.birthdate = Time.new
    s.grade = 10
    s.save!
    
    # now complete all, code half of the starting point profiles
    starting_point_profile.questions.each do |question|
      if question.is_codeable?
        question.responses.create!(scholar_id:s.id, question_id:question.id, response:Faker::Lorem.paragraphs(rand(2)+1))
      else
        question.responses.create!(scholar_id:s.id, question_id:question.id, response:rand(4))
      end
    end
    s.assignments.find_by_profile_id(starting_point_profile.id).update_attributes(:completed => Time.now)
    
    if i%2 == 0
      starting_point_profile.questions.each_with_index do |question, i|
        if question.is_codeable?
          if i == 0
            question.response_from(s).update_attributes(:code => 6.times.collect{|i| rand(5)}.join(',').to_s)
          else
            question.response_from(s).update_attributes(:code => rand(4))
          end
        end
      end
      
      s.assignments.find_by_profile_id(starting_point_profile.id).update_attributes(:is_coded => true)
    end
  end
end
