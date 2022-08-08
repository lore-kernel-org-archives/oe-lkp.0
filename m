Content-Type: multipart/mixed; boundary="===============9158152065147387156=="
MIME-Version: 1.0
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI] 1d52f10917: BUG:KASAN:use-after-free_in_strlen
Date: Mon, 08 Aug 2022 20:53:30 +0000
Message-ID: <YvF3ynw8CmisQAR6@paasikivi.fi.intel.com>
In-Reply-To: <57f48ba3-d01c-f3d8-8e33-65d3cd9a349e@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9158152065147387156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

On Mon, Aug 08, 2022 at 06:54:49PM +0200, Rafael J. Wysocki wrote:
> Hi Sakari,
> =

> On 8/7/2022 2:45 PM, kernel test robot wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: 1d52f10917a751f90e269a0ed9b6cca60dbe0300 ("ACPI: property: Tie =
data nodes to acpi handles")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > in testcase: xsave-test
> > version: xsave-test-x86_64-c2e44fa-1_20220609
> > with following parameters:
> > =

> > 	ucode: 0xec
> > =

> > =

> > =

> > on test machine: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3=
.20GHz with 16G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> The crash below occurs right after a "Can't tag data node" message from
> acpi_tie_nondev_subnodes() and I'm really unsure why acpi_attach_data() h=
as
> failed here, because none of the arguments is NULL.
> =

> Can you have a look at this, please?

Thanks for forwarding this to me.

Faulty error handling code appears to be the direct cause for the crash. It
releases buf.pointer which was still being used by the properties --- even
if tagging data nodes failed (for whatever reason).

It'd be cool if someone could send me DSDT/SSDT from this machine. I wonder
if there's a data node that is referred to from more than one location, and
whether that could lead to two references to the same acpi_handle. I'd hope
this could be disallowed in DSD Guide.

I'll send a patch soon.

-- =

Kind regards,

Sakari Ailus
--===============9158152065147387156==--

