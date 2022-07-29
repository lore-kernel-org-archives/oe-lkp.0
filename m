Content-Type: multipart/mixed; boundary="===============3384731665366039898=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 03d56978dd: BUG:Bad_page_map_in_process
Date: Fri, 29 Jul 2022 13:45:04 +0800
Message-ID: <YuNz4FTXA1MshsjK@xsang-OptiPlex-9020>
In-Reply-To: <CAJnrk1aX6x79AzFPVk1QwU4ivd5AeYwz6Fe2z6HLunBSBA20yg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3384731665366039898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Joanne,
 =

On Wed, Jul 27, 2022 at 04:41:04PM -0700, Joanne Koong wrote:
> =

> I examined more closely the changes between v2 and v3 and I don't see
> anything that would lead to this error either (I'm assuming  v2 is
> okay because this report wasn't generated for it). Looking at the
> stack trace too, I'm not seeing anything that sticks out (eg this
> looks like a memory mapping failure and bhash2 didn't modify mapping
> or paging code).
> =

> I don't think this bug report is related to the bhash2 changes. But
> please let me know if you disagree.

thanks for detail information. we are running more tests to confirm now.
will update you later.

> =

> Thanks,
> Joanne
> =

> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> >
> >
--===============3384731665366039898==--

