using System;

namespace Database.Game.Models;

public class Player
{
    public Guid Id;
    public required string AccountId;
    public required string Name;
    public DateTime CreatedAt;
}
