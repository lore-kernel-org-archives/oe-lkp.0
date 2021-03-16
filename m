Content-Type: multipart/mixed; boundary="===============6549431831219679520=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [mm] f3344adf38: fxmark.hdd_btrfs_DWAL_63_bufferedio.works/sec -52.4% regression
Date: Tue, 16 Mar 2021 14:31:53 +0100
Message-ID: <YFCzSYIgCn9YAXf/@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wi1KcOZo4JeRDgJCU0gB5v16q6GJsFtF365MSfM8hH3zA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6549431831219679520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 15-03-21 13:42:50, Linus Torvalds wrote:
> If somebody can actually figure out what happened there, that would be
> good, but for now it goes into my "archived as a random outlier"
> folder.

This is not something new. We have seen reports like that in the past
already. In many cases there was no apparent reason except for potential
code alignment: e.g. http://lkml.kernel.org/r/20200409135029.GA2072(a)xsang=
-OptiPlex-9020
There were some other memcg related which didn't really show any
increase in cache misses or similar. I cannot find those in my notes
right now. There were others like https://lore.kernel.org/lkml/202011020915=
43.GM31092(a)shao2-debian/
with analysis http://lkml.kernel.org/r/20201125062445.GA51005(a)shbuild999.=
sh.intel.com
which actually pointed to something legit actually.

For this particular report I do not see any real relation to the patch
either.
-- =

Michal Hocko
SUSE Labs
--===============6549431831219679520==--

