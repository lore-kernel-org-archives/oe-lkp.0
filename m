Content-Type: multipart/mixed; boundary="===============1668438009734538457=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [rtc] 4cd8adb100: WARNING: CPU: 0 PID: 1 at lib/kobject.c:690 kobject_put
Date: Fri, 17 Mar 2017 15:11:37 +0900
Message-ID: <20170317061137.GA21612@kroah.com>
In-Reply-To: <72ddb00d-3eda-1a16-9c3b-10055dd4e730@deltatee.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1668438009734538457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2017 at 11:23:26PM -0600, Logan Gunthorpe wrote:
> Hey,
> =

> I think I see the issue here: in a couple of error conditions, the RTC
> code will not initialize and ask for the cdev. However, my change will
> always call cdev_add and cdev_del even though the rtc code did not call
> cdev_init. I'll have to add a guard around dev->devt in the new
> cdev_device functions. I'll prepare another patch tomorrow.
> =

> I also noticed that I neglected to remove the prototypes for the two RTC
> function I removed. I'll fix that too.

Ok, I'm just going to drop this series from my tree so that other
patches in it can get pushed out to linux-next.  Please resend the full
series after you have fixed it up, and I'll be glad to queue it up
again.

thanks,

greg k-h

--===============1668438009734538457==--

