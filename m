Content-Type: multipart/mixed; boundary="===============2475180129156434722=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: b276527539 ("staging: most: move core files out of the staging .."): [ 12.247349] BUG: kernel NULL pointer dereference, address: 00000000
Date: Fri, 24 Apr 2020 12:16:34 +0200
Message-ID: <20200424101634.GB390100@kroah.com>
In-Reply-To: <1e725f60c598cd8a5f167fd63ade6ee173960f01.camel@microchip.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2475180129156434722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 09:41:36AM +0000, Christian.Gromm(a)microchip.com w=
rote:
> On Sun, 2020-03-29 at 21:39 +0800, kernel test robot wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad
> > commit is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> > staging-next
> > =

> > commit b276527539188f1f61c082ebef27803db93e536d
> > Author:     Christian Gromm <christian.gromm@microchip.com>
> > AuthorDate: Tue Mar 10 14:02:40 2020 +0100
> > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CommitDate: Tue Mar 24 13:42:44 2020 +0100
> > =

> >     staging: most: move core files out of the staging area
> > =

> >     This patch moves the core module to the /drivers/most directory
> >     and makes all necessary changes in order to not break the build.
> > =

> >     Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> >     Link: =

> > https://lore.kernel.org/r/1583845362-26707-2-git-send-email-christian.g=
romm(a)microchip.com
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > =

> > 22dd4acc80  Staging: speakup: Add identifier name to function
> > declaration arguments.
> > b276527539  staging: most: move core files out of the staging area
> > e681bb287f  staging: vt6656: Use DIV_ROUND_UP macro instead of
> > specific code
> > +-------------------------------------------------------+----------
> > --+------------+------------+
> > >                                                       | 22dd4acc80
> > > | b276527539 | e681bb287f |
> > +-------------------------------------------------------+----------
> > --+------------+------------+
> > > boot_successes                                        |
> > > 26         | 0          | 0          |
> > > boot_failures                                         |
> > > 8          | 11         | 11         |
> > > WARNING:possible_circular_locking_dependency_detected |
> > > 8          |            |            |
> > > BUG:kernel_NULL_pointer_dereference,address           |
> > > 0          | 11         | 11         |
> > > Oops:#[##]                                            |
> > > 0          | 11         | 11         |
> > > EIP:__list_add_valid                                  |
> > > 0          | 11         | 11         |
> > > Kernel_panic-not_syncing:Fatal_exception              |
> > > 0          | 11         | 11         |
> > +-------------------------------------------------------+----------
> > --+------------+------------+
> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > [   12.242090] no options.
> > [   12.245364] FPGA DOWNLOAD --->
> > [   12.245723] FPGA image file name: xlinx_fpga_firmware.bit
> > [   12.246548] GPIO INIT FAIL!!
> > [   12.246995] most_sound: init()
> > [   12.247349] BUG: kernel NULL pointer dereference, address: =

> =

> =

> The init order of the modules is wrong in case the driver is
> being built in-tree.
> =

> The init function of module most_sound is called before the
> core itself is being initialized.
> =

> [    5.179189] most_sound: init()
> [    5.180205] mostcore: __init()
> =

> Hence the list used in the core to store and track the
> registered components has not been initialized with
> INIT_LIST_HEAD(&comp_list) by the time the sound module
> tries to register itself with the core.
> =

> The Kconfig of most_sound, however, has a dependency to
> MOST. How can the build system be forced to initialize the
> core module first?

Linker order is the thing here.

You can mess with the init levels here, and use subsys_initcall() for
mostcore, will that fix it?

thanks,

greg k-h
--===============2475180129156434722==--

