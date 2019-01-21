using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GoogleInvisibleRecaptcha.Startup))]
namespace GoogleInvisibleRecaptcha
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
