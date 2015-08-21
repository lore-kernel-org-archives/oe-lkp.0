Content-Type: multipart/mixed; boundary="===============5599915754436128487=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [rhashtable] 9d901bc0515: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x6a/0x99()
Date: Fri, 21 Aug 2015 15:09:42 +0800
Message-ID: <1440140982.8683.32.camel@intel.com>
In-Reply-To: <20150821064207.GA5835@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5599915754436128487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-08-21 at 14:42 +0800, Herbert Xu wrote:
> On Fri, Aug 21, 2015 at 02:05:19PM +0800, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =

> > master
> > commit 9d901bc05153bbf33b5da2cd6266865e531f0545 ("rhashtable: Free =

> > bucket tables asynchronously after rehash")
> > =

> > With the commit, the possibility of OOM is increased under our boot =

> > testing.
> =

> Can you gather some stats on how much memory rhashtable is actually
> using? With that kernel you've probably got only one rhashtable user
> which is netlink.
> =

> Bear in mind that this is a fairly low-memory machine (< 300M) so
> it's not clear to me that this patch is the root cause of your OOM
> problem.

Sorry, my fault.  There are OOM for parent commit too, just some dmesg
difference, which I miss understood.  Please ignore this report.  I
will be more careful next time.

Best Regards,
Huang, Ying


--===============5599915754436128487==--

