Content-Type: multipart/mixed; boundary="===============3968107613425203684=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Fri, 21 May 2021 09:16:42 +0800
Message-ID: <e9f776c4-1ade-42a6-54c4-7fe3442e2392@linux.intel.com>
In-Reply-To: <20210520095119.GA18952@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3968107613425203684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On 5/20/2021 5:51 PM, Jan Kara wrote:
> Hello!
> =

> On Thu 20-05-21 15:13:20, Xing Zhengjun wrote:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0 Do you have time to look at this? The regressi=
on still existed in the
>> latest Linux mainline v5.13-rc2.
> =

> Thanks for verification and for the ping! I had a look into this and I
> think the regression is caused by the changes in orphan handling. The load
> runs multiple tasks all creating and deleting files. This generally
> contends on the orphan locking with fast storage (which is your case
> because you use ramdisk as a backing store AFAICT). And the changes I did
> move superblock checksum computation under the orphan lock so the lock ho=
ld
> times are now higher.
> =

> Sadly it is not easy to move checksum update from under the orphan lock a=
nd
> maintain checksum consistency since the checksum has to be recomputed
> consistently with the changes of superblock state. But I have one idea how
> we could maybe improve the situation. Can you check whether attached patch
> recovers the regression? Because that's about how good it could get when =
we
> are more careful when writing out superblock.
> =

> 								Honza
> =


I apply the patch based on v5.13-rc2 and test, it can not recover the =

regression and the regression became more serious(-45.7%).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/disk/md/fs/test/load/cpufreq_go=
vernor/ucode:
 =

lkp-csl-2sp9/aim7/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/4BR=
D_12G/RAID1/ext4/creat-clo/1000/performance/0x5003006

commit:
   4392fbc4bab57db3760f0fb61258cb7089b37665
   05c2c00f3769abb9e323fcaca70d2de0b48af7ba
   v5.13-rc2
   2a1eb1a2fc08daaaf76a5aa8ffa355b5a5013d86    (the test patch)

4392fbc4bab57db3 05c2c00f3769abb9e323fcaca70                   v5.13-rc2 =

2a1eb1a2fc08daaaf76a5aa8ffa
---------------- --------------------------- --------------------------- =

---------------------------
          %stddev     %change         %stddev     %change =

%stddev     %change         %stddev
              \          |                \          |                \ =

          |                \
      13342           -11.8%      11771 =C2=B1  2%     -14.2%      11450 =

       -45.7%       7240 =C2=B1  3%  aim7.jobs-per-min



-- =

Zhengjun Xing
--===============3968107613425203684==--

