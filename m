Content-Type: multipart/mixed; boundary="===============4484302020891105736=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: LKP with bluetooth-next
Date: Fri, 04 Dec 2020 07:30:20 +0800
Message-ID: <20201203233020.GA31431@intel.com>
In-Reply-To: <0430DD4D-97F3-42BA-898E-9FF20FD23A9F@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4484302020891105736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 09:09:27PM +0000, An, Tedd wrote:
> Hi =

> =

> I am working on Linux Bluetooth and I have a question about the service.
> For your background, the tree we are working is =

> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.=
git
> And the mailing list is linux-bluetooth(a)vger.kernel.org
> =

> We had received the test result with the patches in our mailing list once=
 in a while, but we don't receive the test result for all the relevant patc=
hes.
> I just wonder if the 0-Day test runs all the patches in the mailing list =
and send out the email regardless of the result or it only sends the failed=
 patches.
Hi Tedd, currently we will try to test every patch as we can, but it depends
on whether we can successfully find a base for the patch series so
we can form a branch. We recommend to use --base as documented in
https://git-scm.com/docs/git-format-patch.

Thus it's possible some patches are not covered.

> =

> We prefer to receive the result for all patches even if it success so we =
can confirm it.
For repo side, it is now configured to notify overall build status.
For mailing list's patch, we will take a look for notifying success info.

> =

> If it is only run per request without monitoring the patches from the mai=
ling list, I would like to trigger the 0-Day test manually.
> How can I do that and is there any specific format?
We currently doesn't support manual testing from users, mostly
due to limited computing resource we have. We run standard set
of build testing for all repos. For runtime testing, we may not
cover your code as we test on server platforms and doesn't have
corresponding suite for bluetooth.

> =

> Thanks for your support in advance.
you are welcome, you can drop mail to lkp(a)intel.com to reach us.

> =

> Regards,
> Tedd
> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4484302020891105736==--

