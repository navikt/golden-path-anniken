import { Button } from "@navikt/ds-react";
import styles from "./page.module.css";
import { ThumbUpIcon } from "@navikt/aksel-icons";

const Home = () => (
  <main>
    <Button
      className={styles.limeButton}
      icon={<ThumbUpIcon title="a11y tittel" />}
    >
      Knapp
    </Button>
  </main>
);

export default Home;
