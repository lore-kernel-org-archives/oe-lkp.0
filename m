Content-Type: multipart/mixed; boundary="===============3983460140966510517=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] seccomp: fix SECCOMP_USER_NOTIF_FLAG_CONTINUE test
Date: Mon, 21 Oct 2019 09:20:07 -0700
Message-ID: <201910210919.9187DFE5@keescook>
In-Reply-To: <20191021135013.GD28452@cisco>
List-Id: <oe-lkp.lists.linux.dev>

--===============3983460140966510517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 07:50:13AM -0600, Tycho Andersen wrote:
> On Mon, Oct 21, 2019 at 11:10:55AM +0200, Christian Brauner wrote:
> > The ifndef for SECCOMP_USER_NOTIF_FLAG_CONTINUE was placed under the
> > ifndef for the SECCOMP_FILTER_FLAG_NEW_LISTENER feature. This will not
> > work on systems that do support SECCOMP_FILTER_FLAG_NEW_LISTENER but do=
 not
> > support SECCOMP_USER_NOTIF_FLAG_CONTINUE. So move the latter ifndef out=
 of
> > the former ifndef's scope.
> > =

> > 2019-10-20 11:14:01 make run_tests -C seccomp
> > make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-7.6-0eebf=
ed2954f152259cae0ad57b91d3ea92968e8/tools/testing/selftests/seccomp'
> > gcc -Wl,-no-as-needed -Wall  seccomp_bpf.c -lpthread -o seccomp_bpf
> > seccomp_bpf.c: In function =E2=80=98user_notification_continue=E2=80=99:
> > seccomp_bpf.c:3562:15: error: =E2=80=98SECCOMP_USER_NOTIF_FLAG_CONTINUE=
=E2=80=99 undeclared (first use in this function)
> >   resp.flags =3D SECCOMP_USER_NOTIF_FLAG_CONTINUE;
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > seccomp_bpf.c:3562:15: note: each undeclared identifier is reported onl=
y once for each function it appears in
> > Makefile:12: recipe for target 'seccomp_bpf' failed
> > make: *** [seccomp_bpf] Error 1
> > make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-0eebfe=
d2954f152259cae0ad57b91d3ea92968e8/tools/testing/selftests/seccomp'
> > =

> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > Fixes: 0eebfed2954f ("seccomp: test SECCOMP_USER_NOTIF_FLAG_CONTINUE")
> > Cc: linux-kselftest(a)vger.kernel.org
> > Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> =

> Reviewed-by: Tycho Andersen <tycho@tycho.ws>

Thanks! Applied to my for-next/seccomp tree.

-- =

Kees Cook
--===============3983460140966510517==--

