Content-Type: multipart/mixed; boundary="===============3672374214711412396=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] 6209f6fc62: general_protection_fault:#[##]
Date: Tue, 25 Sep 2018 09:31:45 +0200
Message-ID: <20180925073145.GO18685@dhcp22.suse.cz>
In-Reply-To: <084cf8cd-f384-8694-16c0-d1e2abfb9099@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3672374214711412396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 25-09-18 15:00:15, Rong Chen wrote:
> =

> =

> On 09/25/2018 02:06 PM, Michal Hocko wrote:
> > On Tue 25-09-18 13:48:20, kernel test robot wrote:
> > > FYI, we noticed the following commit (built with gcc-7):
> > > =

> > > commit: 6209f6fc62835d84c2a92d237588a114e39436ce ("mm, oom: rework mm=
ap_exit vs. oom_reaper synchronization")
> > > https://github.com/0day-ci/linux UPDATE-20180911-024633/Tetsuo-Handa/=
mm-oom-Fix-unnecessary-killing-of-additional-processes/20180910-163452
> > Do you have a msg-id to the patch that has been tested?
> =

> message_id: 20180910125513.311-2-mhocko(a)kernel.org

Thanks! It woudl be really great if this was a part of the report when
testing patches which are not mainline yet.

This patch resulting in a crash is quite surprising. The patch is RFC
and not tested yet but I will definitely have a look. Could you help me
some more and give faddr2line __oom_reap_task_mm+0x40 please?
-- =

Michal Hocko
SUSE Labs

--===============3672374214711412396==--

