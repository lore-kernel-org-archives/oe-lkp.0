Content-Type: multipart/mixed; boundary="===============4247400725434589363=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 12:39:34 -0800
Message-ID: <alpine.DEB.2.21.1812031237340.192288@chino.kir.corp.google.com>
In-Reply-To: <20181203185954.GM31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4247400725434589363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Dec 2018, Michal Hocko wrote:

> I have merely said that a better THP locality needs more work and during
> the review discussion I have even volunteered to work on that. There
> are other reclaim related fixes under work right now. All I am saying
> is that MADV_TRANSHUGE having numa locality implications cannot satisfy
> all the usecases and it is particurarly KVM that suffers from it.

I think extending functionality so thp can be allocated remotely if truly =

desired is worthwhile just so long as it does not cause regressions for =

other users.  I think that is separate from the swap storm regression that =

Andrea is reporting, however, since that would also exist even if we =

allowed remote thp allocations when the host is fully fragmented rather =

than only locally fragmented.

--===============4247400725434589363==--

