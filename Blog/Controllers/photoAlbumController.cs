using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Models;
using Blog.Controllers;
using Boke.Controllers;

namespace Blog.Controllers
{
    public class photoAlbumController : Controller
    {
        // GET: photoAlbum
        public static bokeEntities db = new bokeEntities();
        public ActionResult Index(int pid = 1, int id = 0)
        {
            if (Session["userInfo"] == null)
            {
                return Content("<script>location.href='/Home/Index';</script>");
            }
            else
            {
                int uid = (Session["userInfo"] as users).id;
                var data = db.users.FirstOrDefault(u => u.id == uid);
                ViewBag.userInfo = data;


                //获取所有相册簿
                var uPhotos = db.PhotoAlbums.Include("user").Where(p => p.user.id == uid).OrderBy(p => p.id).ToList();
                ViewBag.userPhotoAlbum = uPhotos;
                int ACount = db.albums.Include("PhotoAlbum").Where(p => p.PhotoAlbum.id == pid).Count();

                //展示图片
                var albums = db.albums.Include("PhotoAlbum").Where(a => a.PhotoAlbum.id == pid).OrderBy(a => a.albumID).ToList();
                ViewBag.Albums = albums;


                //分页总数
                int PageCount = (ACount + 5 - 1) / 5;
                ViewBag.PageCount = PageCount;

                return View();
            }
        }
    }
}