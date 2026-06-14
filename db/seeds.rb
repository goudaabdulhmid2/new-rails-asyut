# db/seeds.rb
puts "Clearing database..."
PostEditor.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating users..."
alice = User.create!(name: "Alice Adams", email: "alice@example.com")
bob = User.create!(name: "Bob Builder", email: "bob@example.com")
charlie = User.create!(name: "Charlie Chaplin", email: "charlie@example.com")

puts "Creating posts..."
post1 = Post.create!(title: "First Post by Alice", content: "This is the first post.", creator: alice)
post2 = Post.create!(title: "Bob's Masterpiece", content: "This is a great post.", creator: bob)

puts "Assigning editors..."
# Charlie edits Alice's post
PostEditor.create!(post: post1, editor: charlie)
# Bob and Alice edit Bob's post
PostEditor.create!(post: post2, editor: alice)
PostEditor.create!(post: post2, editor: bob)

puts "Seeding complete!"
puts "Created #{User.count} users."
puts "Created #{Post.count} posts."
puts "Created #{PostEditor.count} post-editor associations."
