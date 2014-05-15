Content-Type: multipart/mixed; boundary="===============5350795134063597190=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [cgroup] a0f9ec1f181: -4.3% will-it-scale.per_thread_ops
Date: Thu, 15 May 2014 14:00:26 +0800
Message-ID: <20140515060026.GA12710@localhost>
In-Reply-To: <20140515045517.GC3825@htj.dyndns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5350795134063597190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Thu, May 15, 2014 at 12:55:17AM -0400, Tejun Heo wrote:
> Hello,
> =

> On Thu, May 15, 2014 at 12:50:39PM +0800, Jet Chen wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git review-kill=
-tree_mutex
> > commit a0f9ec1f181534694cb5bf40b7b56515b8cabef9 ("cgroup: use cgroup_kn=
_lock_live() in other cgroup kernfs methods")
> > =

> > Test case : lkp-nex05/will-it-scale/writeseek
> > =

> > 2074b6e38668e62  a0f9ec1f181534694cb5bf40b
> > ---------------  -------------------------

2074b6e38668e62 is the base of comparison. So "-4.3% will-it-scale.per_thre=
ad_ops"
in the below line means a0f9ec1f18 has lower will-it-scale throughput.

> >    1027273 ~ 0%      -4.3%     982732 ~ 0%  TOTAL will-it-scale.per_thr=
ead_ops
> >        136 ~ 3%     -43.1%         77 ~43%  TOTAL proc-vmstat.nr_dirtied
> >       0.51 ~ 3%     +98.0%       1.01 ~ 4%  TOTAL perf-profile.cpu-cycl=
es.shmem_write_end.generic_perform_write.__generic_file_aio_write.generic_f=
ile_aio_write.do_sync_write
> >       1078 ~ 9%     -16.3%        903 ~11%  TOTAL numa-meminfo.node0.Un=
evictable
> >        269 ~ 9%     -16.2%        225 ~11%  TOTAL numa-vmstat.node0.nr_=
unevictable
> >       1.64 ~ 1%     -14.3%       1.41 ~ 4%  TOTAL perf-profile.cpu-cycl=
es.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_perform_writ=
e.__generic_file_aio_write
> >       1.62 ~ 2%     +14.1%       1.84 ~ 1%  TOTAL perf-profile.cpu-cycl=
es.lseek64

The perf-profile.cpu-cycles.* lines are from "perf record/report".

The last line shows that lseek64() takes 1.62% CPU cycles for
commit 2074b6e38668e62 and that percent increased by +14.1% on
a0f9ec1f181. One of the raw perf record output is

     1.84%  writeseek_proce  libc-2.17.so         [.] lseek64              =
                 =

            |
            --- lseek64

There are 5 runs and 1.62% is the average value.

> I have no idea how to read the above.  Which direction is plus and
> which is minus? Are they counting cpu cycles?  Which files is the
> test seeking?

It's tmpfs files. Because the will-it-scale test case is mean to
measure scalability of syscalls. We do not use HDD/SSD etc. storage
devices when running it.

The will-it-scale/writeseek test code is

char *testcase_description =3D "Separate file seek+write";

void testcase(unsigned long long *iterations)
{       =

        char buf[BUFLEN];
        char tmpfile[] =3D "/tmp/willitscale.XXXXXX";
        int fd =3D mkstemp(tmpfile);

        memset(buf, 0, sizeof(buf));
        assert(fd >=3D 0);
        unlink(tmpfile);

        while (1) {
                lseek(fd, 0, SEEK_SET);
                assert(write(fd, buf, BUFLEN) =3D=3D BUFLEN);
                =

                (*iterations)++;
        }
}

Thanks,
Fengguang

--===============5350795134063597190==--

