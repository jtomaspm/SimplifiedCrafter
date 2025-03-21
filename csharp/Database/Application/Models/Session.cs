namespace Database.Application.Models;

public class Session
{
    public Guid Id;
    public Guid AccountId;
    public required string Token;
    public DateTime CreatedAt;
    public DateTime ExpiresAt;

    public bool IsExpired() => DateTime.UtcNow > ExpiresAt;
}



