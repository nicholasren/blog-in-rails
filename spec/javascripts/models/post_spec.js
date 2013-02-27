describe('Blog.Models.Post', function () {
  it("should be defined", function (){
    expect(Blog.Models.Post).toBeDefined();
  });

  it('can be instantiated', function() {
    var post = new Blog.Models.Post();
    expect(post).not.toBeNull();
  });
});
