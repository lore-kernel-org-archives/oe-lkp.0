Content-Type: multipart/mixed; boundary="===============0519822700711441387=="
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] lguest: explicitly setup /dev/lguest private_data
Date: Tue, 07 Apr 2015 11:34:25 +0300
Message-ID: <CAEnQRZDPLBxh6mgSrVVqd=-WNcyb6rcNL=i9KGdKnL4c5CQs0Q@mail.gmail.com>
In-Reply-To: <1428394698-16938-1-git-send-email-tomvanbraeckel@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0519822700711441387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2015 at 11:18 AM, Tom Van Braeckel
<tomvanbraeckel@gmail.com> wrote:
> The private_data member of the /dev/lguest device file is used to hold
> the current struct lguest and needs to be set to NULL to signify that
> no initialization has taken place.
>
> We explicitly set it to NULL to be independent of whatever value the
> misc subsystem initializes it to.
>
> Signed-off-by: Tom Van Braeckel <tomvanbraeckel@gmail.com>
> ---
> Backstory:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The misc subsystem used to initialize a file's private_data to point to
> the misc device when a driver had registered a custom open file
> operation and initialized it to NULL when a custom open file operation
> had *not* been provided.
>
> This subtle quirk was confusing, to the point where kernel code
> registered *empty* file open operations to have private_data point to
> the misc device structure.
>
> And it lead to bugs, where the addition or removal of a custom open
> file operation surprisingly changed the initial contents of a file's
> private_data structure.
>
> The misc subsystem is currently underdoing changes to *always* set
> private_data to point to the misc device instead of only doing this
> when a custom open file operation has been registered.
>
> Intel's 0day kernel testing robot discovered that the lguest driver
> depended on it implicitly being initialized to NULL, as Fengguang Wu
> reported. Thanks a lot for all the hard work!
>
>  drivers/lguest/lguest_user.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/lguest/lguest_user.c b/drivers/lguest/lguest_user.c
> index c4c6113..054bf70 100644
> --- a/drivers/lguest/lguest_user.c
> +++ b/drivers/lguest/lguest_user.c
> @@ -98,6 +98,17 @@ static int trap(struct lg_cpu *cpu, const unsigned lon=
g __user *input)
>         return 0;
>  }
>
> +/*
> + * Set up the /dev/lguest file structure
> + * The file's private_data will hold the "struct lguest" after
> + * initialization and is used to check whether it is already initialized.
> + */
> +static int open(struct inode *inode, struct file *file)
> +{
> +       file->private_data =3D NULL;
> +       return 0;
> +}
> +
>  /*L:040
>   * Once our Guest is initialized, the Launcher makes it run by reading
>   * from /dev/lguest.
> @@ -405,10 +416,11 @@ static int close(struct inode *inode, struct file *=
file)
>   *
>   * We begin our understanding with the Host kernel interface which the L=
auncher
>   * uses: reading and writing a character device called /dev/lguest.  All=
 the
> - * work happens in the read(), write() and close() routines:
> + * work happens in the open(), read(), write() and close() routines:
>   */
>  static const struct file_operations lguest_fops =3D {
>         .owner   =3D THIS_MODULE,
> +       .open    =3D open,
>         .release =3D close,
>         .write   =3D write,
>         .read    =3D read,

Hmm, isn't this already fixed?

https://lkml.org/lkml/2015/3/23/319

thanks,
Daniel.

--===============0519822700711441387==--

