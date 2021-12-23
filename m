Content-Type: multipart/mixed; boundary="===============3269714475263099448=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [sysctl] 0874c1fba8: sysctl_duplicate_entry
Date: Thu, 23 Dec 2021 16:07:48 +0800
Message-ID: <20211223080746.GA9252@linux.intel.com>
In-Reply-To: <YbKHfodcbICFewC2@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3269714475263099448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luis,

On Thu, Dec 09, 2021 at 02:47:26PM -0800, Luis Chamberlain wrote:
> On Thu, Dec 09, 2021 at 10:03:24PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 0874c1fba8287710354dfc35b2acf23ce3fec018 ("sysctl: add and use =
base directory declarer and registration helper")
> > https://github.com/hying-caritas/linux.git mmotm-2021-11-29
> =

> There were some issues with early incarnations of the patch series.
> Can you try today's linux-next and try to reproduce?

We tested linux-next, no such issue on next-20211222 and 5ca6bbf990 =

("sysctl-add-and-use-base-directory-declarer-and-registration-helper-fix"),=
 thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/runtime/tbox_group/testcase:
  gcc-9/group-01/x86_64-kexec/aliyun-x86_64-20190626.cgz/300s/vm-snb/trinity

commit: =

  0874c1fba8 ("sysctl: add and use base directory declarer and registration=
 helper")
  14705b9e97 ("sysctl: add and use base directory declarer and registration=
 helper") linux-next/master
  5ca6bbf990 ("sysctl-add-and-use-base-directory-declarer-and-registration-=
helper-fix")
  next-20211222

0874c1fba8287710 14705b9e970cf24040c81889607 5ca6bbf9906273e40a824486253   =
            next-20211222 =

---------------- --------------------------- --------------------------- --=
------------------------- =

       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs  %=
reproduction    fail:runs
           |             |             |             |             |       =
      |             |    =

          6:6            0%           6:6         -100%            :6      =
   -100%            :6     dmesg.sysctl_duplicate_entry

> =

>   Luis
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============3269714475263099448==--

