using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
// using MonoGame.Extended.Entities;
using MonoGame.Extended.Screens;
using MonoGame.Extended.Screens.Transitions;
using TestGame.Main;

namespace TestGame
{
    public class Game1 : Game
    {
        public GraphicsDeviceManager _graphics;
        public SpriteBatch _spriteBatch;
        private Texture2D _loading;
        private KeyboardState keyState;
        private readonly ScreenManager _screenManager;

        public Vector2 sprite_position;

        public Game1()
        {
            _graphics = new GraphicsDeviceManager(this); 
            _screenManager = new ScreenManager();
            Components.Add(_screenManager);
            _graphics.PreferredBackBufferWidth = 480;
            _graphics.PreferredBackBufferHeight = 270;
            Content.RootDirectory = "Content";
            IsMouseVisible = true; 
        }

        protected override void Initialize()
        {
            // TODO: Add your initialization logic here
            sprite_position = new Vector2(360, 236);
            keyState = Keyboard.GetState();
            base.Initialize();
        }
        private void LoadTitleScreen()
        {
            _screenManager.LoadScreen(new TitleScreen(this), new FadeTransition(GraphicsDevice, Color.Black));
        }

        private void LoadOptions()
        {
            _screenManager.LoadScreen(new Options(this), new FadeTransition(GraphicsDevice, Color.Black));
        }

        protected override void LoadContent()
        {
            _spriteBatch = new SpriteBatch(GraphicsDevice);
            _loading = Content.Load<Texture2D>("Graphics/loading");
        }

        protected override void UnloadContent()
        {
            _loading.Dispose();
        }

        // TODO: Add your update logic here
        protected override void Update(GameTime gameTime)
        {
            keyState = Keyboard.GetState();

            if (keyState.IsKeyDown(Keys.Escape))
                Exit();
            
            if (keyState.IsKeyDown(Keys.Down))
            {
                LoadTitleScreen();
            }
            if (keyState.IsKeyDown(Keys.Up))
            {
                LoadOptions();
            }

            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.Black);

            // TODO: Add your drawing code here
            _spriteBatch.Begin();
            _spriteBatch.Draw(_loading, sprite_position, Color.White);
            _spriteBatch.End();

            base.Draw(gameTime);
        }
    }
}