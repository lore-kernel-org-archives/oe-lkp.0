Content-Type: multipart/mixed; boundary="===============3489246957089142549=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 17 Aug 2016 18:42:54 +0200
Message-ID: <20160817164254.GE20703@dhcp22.suse.cz>
In-Reply-To: <20160817154825.GC20719@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3489246957089142549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 17-08-16 17:48:25, Michal Hocko wrote:
[...]
> I will try to catch up with the rest of the email thread but from a
> quick glance it just feels like we are doing more more work under the
> lock.

Hmm, so it doesn't seem to be more work in __remove_mapping as pointed
out in http://lkml.kernel.org/r/20160816220250.GI16044(a)dastard

As Mel already pointed out the LRU will be basically single mapping for
this workload so any subtle change in timing might make a difference.
I was looking through 4.6..4.7 and one thing that has changed is the
inactive vs. active LRU size ratio. See 59dc76b0d4df ("mm: vmscan:
reduce size of inactive file list"). The machine has quite a lot of
memory and so the LRUs will be large as well so I guess this could have
change the timing somehow, but it feels like a wild guess so I would be
careful to blame this commit...
-- =

Michal Hocko
SUSE Labs

--===============3489246957089142549==--

