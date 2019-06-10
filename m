Content-Type: multipart/mixed; boundary="===============2909154170757071968=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: livepatching selftests failure on current master branch
Date: Mon, 10 Jun 2019 22:36:13 +0800
Message-ID: <20190610143613.GB20569@intel.com>
In-Reply-To: <95d6fe2a-595b-c73c-4ec0-af02eeaf29e4@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2909154170757071968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 02:43:43PM -0400, Joe Lawrence wrote:
> On 6/5/19 8:49 PM, Philip Li wrote:
> >On Wed, Jun 05, 2019 at 10:51:53AM -0400, Joe Lawrence wrote:
> >>Do the tests only run for unique commits (ie, will it skip when
> >>livepatching.git updates/merges latest linux tree ??)
> >it will not skip, though we are not testing commit by commit. If the iss=
ue
> >is found, and bisect to the bad commit, we will report to author of that
> >commit for information.
> =

> Sorry, I'm not following along, let me rephrase my question...
sorry for late response, i was taken a few days off.

> =

> This is the rough timeline that recently occurred:
> =

> - changes were made to stacktracing API
> -- one commit affected livepatching and broke a selftest
i assume this is another kernel tree, not necessary the livepatch
kernel tree. This tree may or may not be in our monitor list.
- if not, we can't report is before linus pull.
- if yes, we should be able to detect the failure in normal situation,
and trigger a bisect. But due to how we run the testing internally,
it sometimes can fail to trigger bisect or bisect successfully.

> -- Linus pulled the changes
> - the livepatching tree updated its master to Linus tree
> -- Miroslav noticed that self-tests were broken in the livepatch tree
> -- we fixed up the stacktracing API, pushed up to Linus
> -- all is good now
> =

> Could the 0-day bot testing have helped us spot the self-test
> breakage before Linus pulled or when the livepatching tree updated?
This is similar to previous answer. If the error is not fixed, and exists
in any tree under 0day's monitor, we can figure out the culprit patch.

For now, we will have our best effort to detect regression as many as
possible, while it is not reaching 100% for the test suites we have.

> =

> Thanks,
> =

> -- Joe

--===============2909154170757071968==--

