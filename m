Content-Type: multipart/mixed; boundary="===============8133420075745699784=="
MIME-Version: 1.0
From: Oscar Salvador <osalvador@suse.de>
To: lkp@lists.01.org
Subject: Re: [RFC PATCH] mm, memory_hotplug: fix off-by-one in is_pageblock_removable
Date: Wed, 20 Feb 2019 09:33:47 +0100
Message-ID: <20190220083343.g5hdxxmekqsjwo63@d104.suse.de>
In-Reply-To: <20190218181544.14616-1-mhocko@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8133420075745699784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 07:15:44PM +0100, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>

> Fixes: efad4e475c31 ("mm, memory_hotplug: is_mem_section_removable do not=
 pass the end of a zone")
> Reported-by: <rong.a.chen@intel.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Looks good to me.
I glanced quickly over the memhotplug code and I did not see any other place
that could trigger the same problem.

Reviewed-by: Oscar Salvador <osalvador@suse.de>

-- =

Oscar Salvador
SUSE L3

--===============8133420075745699784==--

