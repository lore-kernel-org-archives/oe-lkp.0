Content-Type: multipart/mixed; boundary="===============5365506173658627135=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [nfs] BUG: sleeping function called from invalid context at include/linux/wait.h:976
Date: Tue, 12 Aug 2014 13:21:27 -0400
Message-ID: <CAPDOMVgnUhosctMxG-O8tWvb9-arShatPHt5eGsu-a89jZmXdg@mail.gmail.com>
In-Reply-To: <20140812065958.GL9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5365506173658627135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 2:59 AM, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> On Mon, Aug 11, 2014 at 10:52:38PM -0400, Weston Andros Adamson wrote:
>> Weston Andros Adamson (5):
>>  nfs: change nfs_page_group_lock argument
>>  nfs: fix nonblocking calls to nfs_page_group_lock
>>  nfs: use blocking page_group_lock in add_request
>>  nfs: fix error handling in lock_and_join_requests
>>  nfs: don't sleep with inode lock in lock_and_join_requests
>
> Thanks for taking care of that!
Weston,
Thanks for Cleaning this up for me , I don't known the nfs code that
well and assumed it was lock related but didn't
known where.
Cheers Nick

--===============5365506173658627135==--

