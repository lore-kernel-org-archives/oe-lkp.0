Content-Type: multipart/mixed; boundary="===============5619256793425944370=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Thu, 02 Nov 2017 09:53:57 +0100
Message-ID: <20171102085357.GA14531@kroah.com>
In-Reply-To: <13c66c9d-485f-7615-7a85-47bad9af30d1@osg.samsung.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5619256793425944370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2017 at 04:38:02PM -0600, Shuah Khan wrote:
> > For me also, if I have to test my code outside kernel tree, I usually
> > copy ion.h header file locally and test it.
> > =

> > But, still I have one question about staging tree kernel headers.
> > How the kernel headers are created in case of Android where it uses
> > the ion and other headers heavily?
> > =

> =

> So this is a question for Greg KH? How do we handle staging headers?

We don't :)

Don't work too hard, or at all, for staging headers, someone should be
working to get the code out of staging.  No need to provide "full
functionality" for all of the different kselftest options for staging
code, as that's just going to be a pain.

> We have couple of options here:
> =

> - add a staging header install as part of kselftest

No.

> - add a kselftest source tar-ball utility that covers the staging header
>   dependencies.

No.

Just don't install them, as they are not part of the normal process,
don't do anything special here please.

> I am reluctant to add a local ion.h. I would rather solve the bigger issu=
e.
> I think this might not be the only time we will run into this type of dep=
endency

For any other kernel code, stuff should go into uapi headers, but
staging is "special" here, so don't worry about it.  Use relative paths
and all should be fine for the limited amount of testing possible.

I really do not like to see any staging dependancies out of
drivers/staging/ at all, as staging code should be self-contained and
could be deleted tomorrow with no other side effects at all.  So maybe
there should not be any kselftests allowed for staging code...

thanks,

greg k-h

--===============5619256793425944370==--

