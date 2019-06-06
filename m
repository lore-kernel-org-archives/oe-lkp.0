Content-Type: multipart/mixed; boundary="===============3631270924902531636=="
MIME-Version: 1.0
From: Joe Lawrence <joe.lawrence@redhat.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Thu, 06 Jun 2019 14:43:43 -0400
Message-ID: <95d6fe2a-595b-c73c-4ec0-af02eeaf29e4@redhat.com>
In-Reply-To: <20190606004943.GA30795@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3631270924902531636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/5/19 8:49 PM, Philip Li wrote:
> On Wed, Jun 05, 2019 at 10:51:53AM -0400, Joe Lawrence wrote:
>> Do the tests only run for unique commits (ie, will it skip when
>> livepatching.git updates/merges latest linux tree ??)
> it will not skip, though we are not testing commit by commit. If the issue
> is found, and bisect to the bad commit, we will report to author of that
> commit for information.

Sorry, I'm not following along, let me rephrase my question...

This is the rough timeline that recently occurred:

- changes were made to stacktracing API
-- one commit affected livepatching and broke a selftest
-- Linus pulled the changes
- the livepatching tree updated its master to Linus tree
-- Miroslav noticed that self-tests were broken in the livepatch tree
-- we fixed up the stacktracing API, pushed up to Linus
-- all is good now

Could the 0-day bot testing have helped us spot the self-test breakage =

before Linus pulled or when the livepatching tree updated?

Thanks,

-- Joe

--===============3631270924902531636==--

