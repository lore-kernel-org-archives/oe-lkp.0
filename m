Content-Type: multipart/mixed; boundary="===============7083931087395041570=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mtd] c4dfa25ab3: kernel_BUG_at_fs/sysfs/file.c
Date: Thu, 03 Jan 2019 10:29:58 +0100
Message-ID: <CAJZ5v0jQP-hYHva4xoTxgf815DTSp4MBnF__XPt3cViWF5=zcQ@mail.gmail.com>
In-Reply-To: <20190103092622.GA6262@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7083931087395041570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 3, 2019 at 10:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 02, 2019 at 10:44:50PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Jan 2, 2019 at 8:53 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >
> > [cut]
> >
> > > Greg, Rafael: it does strike me that the "BUG_ON()" in
> > > sysfs_create_file_ns() could easily have been a
> > >
> > >         if (WARN_ON(..))
> > >                 return -EINVAL;
> > >
> > > which would have made the machine boot and probably make things easier
> > > for normal users to report. The kernel test robot doesn't care, but
> > > non-booting kernels are usually not nice to debug or report for normal
> > > human beings..
> >
> > I agree.
> >
> > This isn't a good enough reason to crash the kernel IMO.
>
> I agree too.
>
> Here's a patch for this, I'll queue it up after -rc1 is out.  Rafael,
> look good to you?

Yes, it does.

Please feel free to add

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to it.

>
> --------------
>
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Subject: [PATCH] sysfs: convert BUG_ON to WARN_ON
>
> It's rude to crash the system just because the developer did something
> wrong, as it prevents them from usually even seeing what went wrong.
>
> So convert the few BUG_ON() calls that have snuck into the sysfs code
> over the years to WARN_ON() to make it more "friendly".  All of these
> are able to be recovered from, so it makes no sense to crash.
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  fs/sysfs/dir.c     | 3 ++-
>  fs/sysfs/file.c    | 6 ++++--
>  fs/sysfs/group.c   | 3 ++-
>  fs/sysfs/symlink.c | 3 ++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
> index feeae8081c22..aa85f2874a9f 100644
> --- a/fs/sysfs/dir.c
> +++ b/fs/sysfs/dir.c
> @@ -43,7 +43,8 @@ int sysfs_create_dir_ns(struct kobject *kobj, const voi=
d *ns)
>         kuid_t uid;
>         kgid_t gid;
>
> -       BUG_ON(!kobj);
> +       if (WARN_ON(!kobj))
> +               return -EINVAL;
>
>         if (kobj->parent)
>                 parent =3D kobj->parent->sd;
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index bb71db63c99c..51398457fe00 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -325,7 +325,8 @@ int sysfs_create_file_ns(struct kobject *kobj, const =
struct attribute *attr,
>         kuid_t uid;
>         kgid_t gid;
>
> -       BUG_ON(!kobj || !kobj->sd || !attr);
> +       if (WARN_ON(!kobj || !kobj->sd || !attr))
> +               return -EINVAL;
>
>         kobject_get_ownership(kobj, &uid, &gid);
>         return sysfs_add_file_mode_ns(kobj->sd, attr, false, attr->mode,
> @@ -537,7 +538,8 @@ int sysfs_create_bin_file(struct kobject *kobj,
>         kuid_t uid;
>         kgid_t gid;
>
> -       BUG_ON(!kobj || !kobj->sd || !attr);
> +       if (WARN_ON(!kobj || !kobj->sd || !attr))
> +               return -EINVAL;
>
>         kobject_get_ownership(kobj, &uid, &gid);
>         return sysfs_add_file_mode_ns(kobj->sd, &attr->attr, true,
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 1eb2d6307663..57038604d4a8 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -112,7 +112,8 @@ static int internal_create_group(struct kobject *kobj=
, int update,
>         kgid_t gid;
>         int error;
>
> -       BUG_ON(!kobj || (!update && !kobj->sd));
> +       if (WARN_ON(!kobj || (!update && !kobj->sd)))
> +               return -EINVAL;
>
>         /* Updates may happen before the object has been instantiated */
>         if (unlikely(update && !kobj->sd))
> diff --git a/fs/sysfs/symlink.c b/fs/sysfs/symlink.c
> index 215c225b2ca1..c4deecc80f67 100644
> --- a/fs/sysfs/symlink.c
> +++ b/fs/sysfs/symlink.c
> @@ -23,7 +23,8 @@ static int sysfs_do_create_link_sd(struct kernfs_node *=
parent,
>  {
>         struct kernfs_node *kn, *target =3D NULL;
>
> -       BUG_ON(!name || !parent);
> +       if (WARN_ON(!name || !parent))
> +               return -EINVAL;
>
>         /*
>          * We don't own @target_kobj and it may be removed at any time.
> --

--===============7083931087395041570==--

