Content-Type: multipart/mixed; boundary="===============4528734453665470189=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: Fix make.cross for 0day bot
Date: Thu, 01 Sep 2022 15:06:15 +0800
Message-ID: <YxBZ5wcGUSQ/VeHD@rli9-MOBL1.ccr.corp.intel.com>
In-Reply-To: <CAK7LNATbAVE8QY_QZQkiaNy9UZb2tH30eP50n0TNpgsHVrTKJQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4528734453665470189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 03:55:52PM +0900, Masahiro Yamada wrote:
> Hello,  maintainers of Intel 0day bot,
> =

> make.cross is supposed to use the latest GCC by default
> (according to the comment "use highest available version")
> but actually chooses GCC 9.3.0 rather than gcc-12.1.0.

thanks a lot for pointing out the issue and fixing it. Do you mind to send
a PR to https://github.com/intel/lkp-tests, or you suggest we composing
a patch based on your fix below?

> =

> If both gcc-9.3.0-nolibc and gcc-12.1.0-nolibc exist
> in COMPILER_INSTALL_PATH, make.cross chooses gcc-9.3.0.
> =

> Likewise, make.cross installs gcc-9.3.0 when no suitable compiler is foun=
d.
> =

> =

> This is due the fact that compiler is sorted like follows:
> =

> gcc-10.2.0-nolibc
> gcc-10.3.0-nolibc
> gcc-11.1.0-nolibc
> gcc-11.2.0-nolibc
> gcc-11.3.0-nolibc
> gcc-12.1.0-nolibc
> gcc-4.9.4-nolibc
> gcc-5.5.0-nolibc
> gcc-6.4.0-nolibc
> gcc-6.5.0-nolibc
> gcc-7.5.0-nolibc
> gcc-8.1.0-nolibc
> gcc-9.2.0-nolibc
> gcc-9.3.0-nolibc
> =

> =

> Then, gcc-9.3.0-nolibc is picked up since it is listed at the last.
> =

> =

> =

> 'sort -V' can do natural sort for versions:
> =

> gcc-4.9.4-nolibc
> gcc-5.5.0-nolibc
> gcc-6.4.0-nolibc
> gcc-6.5.0-nolibc
> gcc-7.5.0-nolibc
> gcc-8.1.0-nolibc
> gcc-9.2.0-nolibc
> gcc-9.3.0-nolibc
> gcc-10.2.0-nolibc
> gcc-10.3.0-nolibc
> gcc-11.1.0-nolibc
> gcc-11.2.0-nolibc
> gcc-11.3.0-nolibc
> gcc-12.1.0-nolibc
> =

> =

> =

> =

> One example code change is like follows:
> =

> =

> =

> --- make.cross.old      2022-09-01 12:18:20.933154233 +0900
> +++ make.cross  2022-09-01 15:06:48.995945712 +0900
> @@ -143,7 +143,7 @@
>         local URL=3D'https://download.01.org/0day-ci/cross-package'
>         local list=3D/tmp/0day-ci-crosstool-files
> =

> -       lftp -c "open $URL && find -d 3 > $list" || return
> +       lftp -c "open $URL && find -d 3" | sort -V > $list || return
> =

>         local file
>         local gcc_arch_pattern=3D$(echo "${gcc_arch}" | sed 's/*/.*/g')
> @@ -206,7 +206,7 @@
>         }
> =

>         # use highest available version
> -       gcc_exec=3D${gcc_exec[-1]}
> +       gcc_evec=3D$(tr ' ' '\n' <<< ${gcc_exec[@]} | sort -V | tail -n1)
>  }
> =

>  update_path_env_for_parisc()
> @@ -340,7 +340,7 @@
> =

>                 # load build-in depends libs
>                 local
> deplibs_path=3D($COMPILER_INSTALL_PATH/${COMPILER}*/${gcc_arch}/libexec/g=
cc/${gcc_arch}/*)
> -               deplibs_path=3D${deplibs_path[-1]}
> +               deplibs_path=3D$(tr ' ' '\n' <<< ${deplibs_path[@]} |
> sort -V | tail -n1)
>                 [[ -d $deplibs_path ]] && export
> LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$deplibs_path
> =

>                 install_dependence "$gcc_exec" || return
> =

> =

> =

> -- =

> Best Regards
> Masahiro Yamada
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4528734453665470189==--

