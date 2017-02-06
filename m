Content-Type: multipart/mixed; boundary="===============6677447820299420436=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Mon, 06 Feb 2017 09:12:36 +0100
Message-ID: <20170206081236.GA3097@dhcp22.suse.cz>
In-Reply-To: <20170204081604.GH12121@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6677447820299420436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat 04-02-17 16:16:04, Ye Xiaolong wrote:
> On 01/26, Michal Hocko wrote:
> >On Wed 25-01-17 12:27:06, Ye Xiaolong wrote:
> >> On 01/24, Michal Hocko wrote:
[...]
> >> >perf profiles before and after the patch.
> >> =

> >> Here is the perf profiles, =

> >
> >I do not see any reclaim path in the profile... Could you take a
> >snapshot of /proc/vmstat and /proc/zoneinfo before and after the test
> >please?
> =

> Sorry for the late, just come back from a vacation. Proc data is attached.

Sorry, I wasn't clear enough. Could you provide this data for both with
the patch applied and without, please?
-- =

Michal Hocko
SUSE Labs

--===============6677447820299420436==--

