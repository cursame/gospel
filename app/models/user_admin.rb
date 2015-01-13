class UserAdmin < ActiveRecord::Base
	 validates_presence_of :password
	 #validates_confirmation_of :password, on: :create
	 #validates_length_of :password, minimum: 4
	 validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	 validates_uniqueness_of :email

     after_create do 
     	self.password = Digest::SHA2.hexdigest(self.password)
     	self.salt = SecureRandom.hex(5)
     	self.save
     end

	  def encripted_codification
       Digest::SHA2.hexdigest( self.salt + self.password.to_s + secure_key ) 
    end

    def secure_key
       "supercalifragilisticoespriralidoso35903randomicenoesconfortable92051siempre0419dma40910492damasco"
    end 

    def w_digest(passtd)
     cript = Digest::SHA2.hexdigest( self.salt + passtd.to_s + secure_key )
     compare_acces(cript, encripted_codification )
    end

    def compare_acces(cript, decript)
        if cript ==  decript
          true
          else
           false
        end
    end
end
