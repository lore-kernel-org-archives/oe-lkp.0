Content-Type: multipart/mixed; boundary="===============1276681847821446121=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Tue, 02 Feb 2021 18:49:51 -0800
Message-ID: <20210203024951.GA1837780@carbon.DHCP.thefacebook.com>
In-Reply-To: <59b6fda7-509a-0afb-112d-46c1e73c589b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1276681847821446121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 04:18:27PM +0800, Xing, Zhengjun wrote:
> =

> =

> On 1/14/2021 11:18 AM, Roman Gushchin wrote:
> > On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -62.4% regression of hackbench.throughput due to co=
mmit:
> > Hi!
> > =

> > Commit "mm: memcg/slab: optimize objcg stock draining" (currently only =
in the mm tree,
> > so no stable hash) should improve the hackbench regression.
> The commit has been merged into Linux mainline :
> =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab: optimize=
 objcg
> stock draining")
> I test the regression still existed.

Hm, so in your setup it's about the same with and without this commit?

It's strange because I've received a letter stating a 45.2% improvement rec=
ently:
https://lkml.org/lkml/2021/1/27/83

Thanks!
--===============1276681847821446121==--

