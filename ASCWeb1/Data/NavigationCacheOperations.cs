using ASCWeb1.Models;
using Microsoft.Extensions.Caching.Distributed;
using System.Text.Json;

namespace ASCWeb1.Data
{
    public class NavigationCacheOperations : INavigationCacheOperations
    {
        private readonly IDistributedCache _cache;
        private readonly string NavigationCacheName = "NavigationCache";

        public NavigationCacheOperations(IDistributedCache cache)
        {
            _cache = cache;
        }

        public async Task CreateNavigationCacheAsync()
        {
            var jsonContent = await File.ReadAllTextAsync("Navigation/Navigation.json");
            await _cache.SetStringAsync(NavigationCacheName, jsonContent);
        }

        public async Task<NavigationMenu> GetNavigationCacheAsync()
        {
            var cachedData = await _cache.GetStringAsync(NavigationCacheName);
            
            if (string.IsNullOrEmpty(cachedData))
            {
                // Nếu cache trống, tự động tạo lại từ file
                Console.WriteLine("⚠️ Navigation cache trống, đang tạo lại...");
                await CreateNavigationCacheAsync();
                cachedData = await _cache.GetStringAsync(NavigationCacheName);
                
                if (string.IsNullOrEmpty(cachedData))
                {
                    Console.WriteLine("❌ Không thể tạo navigation cache!");
                    return new NavigationMenu();
                }
            }

            var navigationMenu = JsonSerializer.Deserialize<NavigationMenu>(cachedData);
            return navigationMenu ?? new NavigationMenu();
        }
    }
}
