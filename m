Content-Type: multipart/mixed; boundary="===============2125723244216906736=="
MIME-Version: 1.0
From: Theodore Y. Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] d3b6f23f71: stress-ng.fiemap.ops_per_sec -60.5% regression
Date: Wed, 19 Aug 2020 13:49:24 -0400
Message-ID: <20200819174924.GB5561@mit.edu>
In-Reply-To: <b29f6c18-f9c7-7e43-5b13-b5724fbf8d1a@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2125723244216906736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looking at what the stress-ng fiemap workload is doing, and
it's.... interesting.

It is running 4 processes which are calling FIEMAP on a particular
file in a loop, with a 25ms sleep every 64 times.  And then there is a
fifth process which is randomly writing to the file and calling
punch_hole to random offsets in the file.

So this is quite different from what Ritesh has been benchmarking
which is fiemap in isolation, as opposed to fiemap racing against a 3
other fiemap processes plus a process which is actively modifying the
file.

In the original code, if I remember correctly, we were using a shared
reader/writer lock to look at the extent tree blocks directly, but we
hold the i_data_sem rw_sempahore for the duration of the fiemap call.

In the new code, we're going through the extent_status cache, which is
grabbing the rw_spinlock each time we do a lookup in the extents
status tree.  So this is a much finer-grained locking and that is
probably the explanation for the increased time for running fiemap in
the contended case.

If this theory is correct, we would probably get back the performance
by wrapping the calls to iomap_fiemap() with {up,down}_read(&ei->i_data_sem)
in ext4_fiemap().

That being said, however ---- it's clear what real-life workload cares
about FIEMAP performance, especially with multiple threads all calling
FIEMAP racing against a file which is being actively modified.  Having
stress-ng do this to find potential kernel bugs is a great thing, so I
understand why stress-ng might be doing this as a QA tool.  Why we
should care about stress-ng as a performance benchmark, at least in
this case, is much less clear to me.

Cheers,

					- Ted
--===============2125723244216906736==--

