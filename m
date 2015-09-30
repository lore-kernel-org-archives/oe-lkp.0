Content-Type: multipart/mixed; boundary="===============3907292501300035280=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] 4aac1bf05b: -2.9% fsmark.files_per_sec
Date: Wed, 30 Sep 2015 16:35:58 +0800
Message-ID: <871tdg718x.fsf@yhuang-dev.intel.com>
In-Reply-To: <20150929200613.66c3ab4f@synchrony.poochiereds.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3907292501300035280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jeff Layton <jeff.layton@primarydata.com> writes:

> On Wed, 30 Sep 2015 07:27:54 +0800
> "Huang\, Ying" <ying.huang@linux.intel.com> wrote:
>
>> Jeff Layton <jeff.layton@primarydata.com> writes:
>> =

>> > On Mon, 28 Sep 2015 14:49:32 +0800
>> > kernel test robot <ying.huang@intel.com> wrote:
>> >
>> >> FYI, we noticed the below changes on
>> >> =

>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iteratio=
ns/nr_threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_=
files_per_directory:
>> >>   lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/pe=
rformance/1x/32t/1HDD/xfs/nfsv4/5K/400M/fsyncBeforeClose/16d/256fpd
>> >> =

>> >> commit: =

>> >>   cd2d35ff27c4fda9ba73b0aa84313e8e20ce4d2c
>> >>   4aac1bf05b053a201a4b392dd9a684fb2b7e6103
>> >> =

>> >
>> > A question...
>> >
>> > I think my tree should now contain a fix for this, but with a
>> > performance regression like this it's difficult to know for sure.
>> >
>> > Is there some (automated) way to request that the KTR redo this test?
>> > If not, will I get a note saying "problem seems to now be fixed" or do
>> > I just take a lack of further emails from the KTR about this as a sign
>> > that it's resolved?
>> =

>> Can you provide the branch name and commit ID for your tree with fix?  I
>> can confirm whether it is fixed for you.
>> =

> Sure:
>
> git://git.samba.org/jlayton/linux.git nfsd-4.4
>
> The tip commit is ed3d7c1e01a76f5ecc7444067704a82af4c2f76e.
>

It seems that the regression is fixed at that commit.  Thanks!

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/xfs/nfsv4/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  cd2d35ff27c4fda9ba73b0aa84313e8e20ce4d2c
  4aac1bf05b053a201a4b392dd9a684fb2b7e6103
  ed3d7c1e01a76f5ecc7444067704a82af4c2f76e

cd2d35ff27c4fda9 4aac1bf05b053a201a4b392dd9 ed3d7c1e01a76f5ecc74440677 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

  14415356 =C2=B1  0%      +2.6%   14788625 =C2=B1  1%      +4.1%   1500830=
1 =C2=B1  0%  fsmark.app_overhead
    441.60 =C2=B1  0%      -2.9%     428.80 =C2=B1  0%      -0.4%     439.6=
8 =C2=B1  0%  fsmark.files_per_sec
    185.78 =C2=B1  0%      +2.9%     191.26 =C2=B1  0%      +0.3%     186.3=
7 =C2=B1  0%  fsmark.time.elapsed_time
    185.78 =C2=B1  0%      +2.9%     191.26 =C2=B1  0%      +0.3%     186.3=
7 =C2=B1  0%  fsmark.time.elapsed_time.max
     97472 =C2=B1  0%      -2.8%      94713 =C2=B1  0%      -0.8%      9665=
7 =C2=B1  0%  fsmark.time.involuntary_context_switches

Best Regards,
Huang, Ying

--===============3907292501300035280==--

