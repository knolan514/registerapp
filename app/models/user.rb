class User

  def initialize(a,b,c,d,e,f,g,h,i)
    @name = a
    @address = b
    @city = c
    @state = d
    @postal = e
    @country = f
    @email = g
    @userid = h
    @password = i
  end

  def name
    @name
  end

  def address
    @address
  end

  def city
    @city
  end

  def state
    @state
  end

  def postal
    @postal
  end

  def country
    @country
  end

  def email
    @email
  end

  def email= email
    @email = email
  end

  def userid
    @userid
  end

  def password
    @password
  end

end
