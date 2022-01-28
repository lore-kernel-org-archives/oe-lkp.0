Content-Type: multipart/mixed; boundary="===============3551639341674644066=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ocfs2] c42ff46f97: sysctl_table_check_failed
Date: Fri, 28 Jan 2022 13:04:21 +0100
Message-ID: <20220128120421.kzo5iduigr7k55bs@quack3.lan>
In-Reply-To: <CAHk-=wgT6wuBB=pK2bGNQbioNCdJHT8Jnvs+4oT25jX1JFyhgg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3551639341674644066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 28-01-22 10:00:29, Linus Torvalds wrote:
> On Fri, Jan 28, 2022 at 8:53 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > commit: 46e33fd45a52bf03769906e64d8a8a1ab317777d ("ocfs2: simplify subd=
irectory
> > registration with register_sysctl()")
> =

> Well, it's apparently commit c42ff46f97c1 ("ocfs2: simplify
> subdirectory registration with register_sysctl()") in mainline now.
> =

> What worries me a bit is that the commit was auto-generated, and when
> reading the commit message it reads as if it wasn't supposed to cause
> any semantic changes at all.
> =

> Is the cause of this that 'nm' is supposed to be a directory, and
> register_sysctl() doesn't handle directories?
> =

> I don't know this code at all, should it have been simplified even
> further with something (TOTALLY UNTESTED) like the attached?

Yep, I've tested the patch and it fixes the failure for me. Feel free to
add:

Tested-by: Jan Kara <jack@suse.cz>

Also the change makes sense to me as far as I'm reading register_sysctl()
so you can also add:

Reviewed-by: Jan Kara <jack@suse.cz>



								Honza

> diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
> index 731558a6f27d..dd77b7aaabf5 100644
> --- a/fs/ocfs2/stackglue.c
> +++ b/fs/ocfs2/stackglue.c
> @@ -661,17 +661,6 @@ static struct ctl_table ocfs2_nm_table[] =3D {
>  	{ }
>  };
>  =

> -static struct ctl_table ocfs2_mod_table[] =3D {
> -	{
> -		.procname	=3D "nm",
> -		.data		=3D NULL,
> -		.maxlen		=3D 0,
> -		.mode		=3D 0555,
> -		.child		=3D ocfs2_nm_table
> -	},
> -	{ }
> -};
> -
>  static struct ctl_table_header *ocfs2_table_header;
>  =

>  /*
> @@ -682,7 +671,7 @@ static int __init ocfs2_stack_glue_init(void)
>  {
>  	strcpy(cluster_stack_name, OCFS2_STACK_PLUGIN_O2CB);
>  =

> -	ocfs2_table_header =3D register_sysctl("fs/ocfs2", ocfs2_mod_table);
> +	ocfs2_table_header =3D register_sysctl("fs/ocfs2/nm", ocfs2_nm_table);
>  	if (!ocfs2_table_header) {
>  		printk(KERN_ERR
>  		       "ocfs2 stack glue: unable to register sysctl\n");

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============3551639341674644066==--

