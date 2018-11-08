Content-Type: multipart/mixed; boundary="===============1069344349440120066=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: 79904925f4 ("mm, memory_hotplug: teach has_unmovable_pages .."): BUG: KASAN: slab-out-of-bounds in has_unmovable_pages
Date: Thu, 08 Nov 2018 09:18:28 +0100
Message-ID: <20181108081828.GO27423@dhcp22.suse.cz>
In-Reply-To: <5be3b39a.eGB2QlysHxs7H5yv%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1069344349440120066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 08-11-18 11:55:06, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/UPDATE-20181103-085315/Baoquan-H=
e/Memory-hotplug-failed-to-offline-on-bare-metal-system-of-multiple-nodes/2=
0181102-015735

Thanks for the report but we have dropped this patch in favor of
http://lkml.kernel.org/r/20181106095524.14629-1-mhocko(a)kernel.org
-- =

Michal Hocko
SUSE Labs

--===============1069344349440120066==--

