using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended.Screens;
using MonoGame.Extended.Screens.Transitions;
using Microsoft.Xna.Framework.Media;

namespace Ping
{
    public class Game1 : Game
    {
        private GraphicsDeviceManager _graphics;
        private SpriteBatch _spriteBatch;
        private Texture2D monogatari;
        private KeyboardState keyState;
        private Song FortyFeet;

        Vector2 sprite_position;
        float sprite_speed;

        public Game1()
        {
            _graphics = new GraphicsDeviceManager(this);
            _graphics.PreferredBackBufferWidth = 480;
            _graphics.PreferredBackBufferHeight = 270;
            Content.RootDirectory = "Content";
            IsMouseVisible = true;
        }

        protected override void Initialize()
        {
            // TODO: Add your initialization logic here
            sprite_position = new Vector2(_graphics.PreferredBackBufferWidth / 2, _graphics.PreferredBackBufferHeight / 2);
            sprite_speed = 200f; 
            keyState = Keyboard.GetState();
            base.Initialize();
        }

        protected override void LoadContent()
        {
            _spriteBatch = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here
            monogatari = Content.Load<Texture2D>("dontknow");
        }
        void MediaPlayer_MediaStateChanged(object sender, System.EventArgs e)
        {
            // 0.0f is silent, 1.0f is full volume
            MediaPlayer.Volume -= 0.1f;
            MediaPlayer.Play(FortyFeet);
        }

        protected override void UnloadContent()
        {
            monogatari.Dispose();
            FortyFeet.Dispose();
        }

        protected override void Update(GameTime gameTime)
        {
            keyState = Keyboard.GetState();

            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || keyState.IsKeyDown(Keys.Escape))
            { 
                Exit();
            }

            // TODO: Add your update logic here

            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);

            // TODO: Add your drawing code here
            _spriteBatch.Begin();

            _spriteBatch.Draw(monogatari, sprite_position, null, Color.White, 0f, new Vector2(monogatari.Width / 2, monogatari.Height / 2), Vector2.One, SpriteEffects.None, 0f); 

            _spriteBatch.End();

            base.Draw(gameTime);
        }
    }
}