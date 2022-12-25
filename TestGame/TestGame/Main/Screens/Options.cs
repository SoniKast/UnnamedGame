using System;
using MonoGame.Extended;
using MonoGame.Extended.Screens;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using Microsoft.Xna.Framework;

namespace TestGame.Main.Screens
{
    public class Options : GameScreen
    {
        private new Game1 Game => (Game1)base.Game;
        private Texture2D fantastisch;
        private Vector2 _position = new Vector2(480 / 2, 270 / 2);
        private Vector2 sprite_center;

        public Options(Game1 game) : base(game) { }

        public override void LoadContent()
        {
            base.LoadContent();
            fantastisch = Content.Load<Texture2D>("SuperFantastisch");
        }

        public override void Update(GameTime gameTime)
        {
            // _position = Vector2.Lerp(_position, Mouse.GetState().Position.ToVector2(), 1f * gameTime.GetElapsedSeconds());
            sprite_center = new Vector2(fantastisch.Width / 2, fantastisch.Height / 2);
        }

        public override void Draw(GameTime gameTime)
        {
            Game.GraphicsDevice.Clear(Color.White);
            Game._spriteBatch.Begin();
            Game._spriteBatch.Draw(fantastisch, _position, null, Color.White, 0, sprite_center, 1, SpriteEffects.None, 0);
            Game._spriteBatch.End();
        }
    }
}
