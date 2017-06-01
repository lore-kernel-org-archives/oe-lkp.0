Content-Type: multipart/mixed; boundary="===============7387618862545039950=="
MIME-Version: 1.0
From: Benjamin Coddington <bcodding@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs/locks] 9d21d181d0: will-it-scale.per_process_ops -14.1% regression
Date: Thu, 01 Jun 2017 07:49:39 -0400
Message-ID: <8F2C3CFF-5C2D-41B0-A895-B1F074DA7943@redhat.com>
In-Reply-To: <1496317284.2845.4.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7387618862545039950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1 Jun 2017, at 7:41, Jeff Layton wrote:

> On Thu, 2017-06-01 at 10:05 +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops =

>> due to commit:
>>
>>
>> commit: 9d21d181d06acab9a8e80eac2ec4eed77b656793 ("fs/locks: Set =

>> fl_nspid at file_lock allocation")
>> url: =

>> https://github.com/0day-ci/linux/commits/Benjamin-Coddington/fs-locks-Al=
loc-file_lock-where-practical/20170527-050700
>>
>>
>
> Ouch, that's a rather nasty performance hit. In hindsight, maybe we
> shouldn't move those off the stack after all? Heck, if it's that
> significant, maybe we should move the F_SETLK callers to allocate =

> these
> on the stack as well?

We can do that.  But, I think this is picking up the =

locks_mandatory_area()
allocation which is now removed.  The attached config has
CONFIG_MANDATORY_FILE_LOCKING=3Dy,  so there's allocation on every =

read/write.

Ben

--===============7387618862545039950==--

