using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Input;
using System.Reflection.Metadata;

namespace Ping.Sprites
{
    internal class Sprites
    {
        protected KeyboardState _currentKey;
        protected KeyboardState _previousKey;
        public Vector2 _position;
        public Color Colour = Color.White;
        public float Speed = 0f;
    }
}
