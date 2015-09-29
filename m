Content-Type: multipart/mixed; boundary="===============5966671091483902085=="
MIME-Version: 1.0
From: Jeff Layton <jeff.layton@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] 4aac1bf05b: -2.9% fsmark.files_per_sec
Date: Tue, 29 Sep 2015 07:41:51 -0400
Message-ID: <20150929074151.0fe32fc9@tlielax.poochiereds.net>
In-Reply-To: <87h9mfhwcj.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5966671091483902085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Sep 2015 14:49:32 +0800
kernel test robot <ying.huang@intel.com> wrote:

> FYI, we noticed the below changes on
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/n=
r_threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_file=
s_per_directory:
>   lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/1x/32t/1HDD/xfs/nfsv4/5K/400M/fsyncBeforeClose/16d/256fpd
> =

> commit: =

>   cd2d35ff27c4fda9ba73b0aa84313e8e20ce4d2c
>   4aac1bf05b053a201a4b392dd9a684fb2b7e6103
> =


A question...

I think my tree should now contain a fix for this, but with a
performance regression like this it's difficult to know for sure.

Is there some (automated) way to request that the KTR redo this test?
If not, will I get a note saying "problem seems to now be fixed" or do
I just take a lack of further emails from the KTR about this as a sign
that it's resolved?

Thanks!
-- =

Jeff Layton <jeff.layton@primarydata.com>

--===============5966671091483902085==--

