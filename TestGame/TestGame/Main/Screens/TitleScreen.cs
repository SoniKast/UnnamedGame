using System;
using MonoGame.Extended;
using MonoGame.Extended.Screens;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;

namespace TestGame.Main.Screens
{
    public class TitleScreen : GameScreen
    {
        private new Game1 Game => (Game1)base.Game;

        private Texture2D _title;
        private Song _theme;
        private Vector2 _position = new Vector2(50, 50);
        public TitleScreen(Game1 game) : base(game) { }

        public override void LoadContent()
        {
            base.LoadContent();
            _title = Content.Load<Texture2D>("title");
            _theme = Content.Load<Song>("Music/kaz");
            MediaPlayer.Play(_theme);
        }
        public override void UnloadContent()
        {
            _title.Dispose();
        }

        public override void Update(GameTime gameTime)
        {
            // _position = Vector2.Lerp(_position, Mouse.GetState().Position.ToVector2(), 1f * gameTime.GetElapsedSeconds());
        }

        public override void Draw(GameTime gameTime)
        {
            Game.GraphicsDevice.Clear(new Color(1, 1, 0));
            Game._spriteBatch.Begin();
            Game._spriteBatch.Draw(_title, Vector2.Zero, Color.White);
            Game._spriteBatch.End();
        }
    }
}
