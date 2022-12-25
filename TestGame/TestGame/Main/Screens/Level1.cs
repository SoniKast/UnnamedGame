using System;
using MonoGame.Extended;
using MonoGame.Extended.Screens;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using Microsoft.Xna.Framework;
using MonoGame.Extended.ViewportAdapters;

namespace TestGame.Main.Screens
{
    public class Level1 : GameScreen
    {
        private new Game1 Game => (Game1)base.Game;
        private OrthographicCamera _camera;

        public Level1(Game1 game) : base(game) { }
        public override void Initialize()
        {
            base.Initialize();

            var viewportAdapter = new BoxingViewportAdapter(Game.Window, GraphicsDevice, 480, 270);
            _camera = new OrthographicCamera(viewportAdapter);
        }

        public override void LoadContent()
        {
            base.LoadContent();
        }

        private Vector2 GetMovementDirection()
        {
            var movementDirection = Vector2.Zero;
            if (Game.keyState.IsKeyDown(Keys.Down))
            {
                movementDirection += Vector2.UnitY;
            }
            if (Game.keyState.IsKeyDown(Keys.Up))
            {
                movementDirection -= Vector2.UnitY;
            }
            if (Game.keyState.IsKeyDown(Keys.Left))
            {
                movementDirection -= Vector2.UnitX;
            }
            if (Game.keyState.IsKeyDown(Keys.Right))
            {
                movementDirection += Vector2.UnitX;
            }
            return movementDirection;
        }

        public override void Update(GameTime gameTime)
        {
            const float movementSpeed = 200;
            _camera.Move(GetMovementDirection() * movementSpeed * gameTime.GetElapsedSeconds());
        }

        public override void Draw(GameTime gameTime)
        {
            var transformMatrix = _camera.GetViewMatrix();
            Game.GraphicsDevice.Clear(new Color(0, 92, 100));
            Game._spriteBatch.Begin(transformMatrix: transformMatrix);
            Game._spriteBatch.DrawRectangle(new RectangleF(250, 250, 50, 50), Color.Black, 1f);
            Game._spriteBatch.End();
        }
    }
}
